package com.doan.Shop.Controller;

import com.doan.Shop.DAO.UserDAO;
import com.doan.Shop.Model.Users;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/UserControllerServlet")
public class UserControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) action = "viewUserList"; // default action
        
        try (UserDAO userDAO = new UserDAO()) {
            switch (action) {
                case "viewUserList":
                    viewUserList(request, response, userDAO);
                    break;
                case "viewUserProfile":
                    viewUserProfile(request, response, userDAO);
                    break;
                default:
                    response.sendRedirect("error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Lỗi khi truy xuất dữ liệu người dùng", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) action = "registerUser"; // default action

        try (UserDAO userDAO = new UserDAO()) {
            switch (action) {
                case "updateUserProfile":
                    updateUserProfile(request, response, userDAO);
                    break;
                case "registerUser":
                    registerUser(request, response, userDAO);
                    break;
                default:
                    response.sendRedirect("error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Lỗi khi xử lý yêu cầu của người dùng", e);
        }
    }

    private void viewUserList(HttpServletRequest request, HttpServletResponse response, UserDAO userDAO) 
            throws SQLException, ServletException, IOException {
        
        List<Users> users = userDAO.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/views/admin/userList.jsp").forward(request, response);
    }

    private void viewUserProfile(HttpServletRequest request, HttpServletResponse response, UserDAO userDAO) 
            throws ServletException, IOException {
        // Lấy userId từ URL hoặc session
        String userIdParam = request.getParameter("userId");
        Integer userId = null;

        if (userIdParam != null && !userIdParam.isEmpty()) {
            try {
                userId = Integer.parseInt(userIdParam); // Chuyển đổi từ URL
            } catch (NumberFormatException e) {
                response.sendRedirect("error.jsp"); // URL không hợp lệ
                return;
            }
        } else {
            HttpSession session = request.getSession();
            userId = (Integer) session.getAttribute("userId"); // Lấy từ session
            if (userId == null) {
                response.sendRedirect("login.jsp"); // Nếu không tìm thấy, yêu cầu đăng nhập
                return;
            }
        }

        // Lấy thông tin người dùng từ DB
        Users user = userDAO.getUserById(userId);
        if (user != null) {
            String mode = request.getParameter("mode");
            if (mode == null) {
                mode = "view"; // Mặc định là chế độ xem
            }
            request.setAttribute("user", user);
            request.setAttribute("mode", mode);
            RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("error.jsp"); // Người dùng không tồn tại
        }
    }


    private void updateUserProfile(HttpServletRequest request, HttpServletResponse response, UserDAO userDAO) 
            throws SQLException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy dữ liệu từ form
        String tenNguoiMua = request.getParameter("tenNguoiMua");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String diaChi = request.getParameter("diaChi");

        // Cập nhật dữ liệu
        userDAO.updateUserProfile(userId, tenNguoiMua, email, sdt, diaChi);

        // Chuyển hướng về chế độ xem
        response.sendRedirect("UserControllerServlet?action=viewUserProfile&mode=view");
    }


    private void registerUser(HttpServletRequest request, HttpServletResponse response, UserDAO userDAO) 
            throws SQLException, ServletException, IOException {
        
        // Retrieve form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String address = request.getParameter("address");

        // Set up new user object
        Users user = new Users();
        user.setTaiKhoan(username);
        user.setMatKhau(password);
        user.setTenNguoiMua(name);
        user.setEmail(email);
        user.setSdt(sdt);
        user.setDiaChi(address);
        user.setChucVu("USER");  // default role

        if (userDAO.registerUser(user)) {
            response.sendRedirect("login.jsp"); // Redirect to login page upon successful registration
        } else {
            request.setAttribute("errorMessage", "Tên đăng nhập đã tồn tại, vui lòng chọn tên khác.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
