package com.doan.Shop.Controller;

import com.doan.Shop.Model.Users;
import com.doan.Shop.DAO.UserDAO;
import com.doan.Shop.Controller.GoogleAccount;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpResponse;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebServlet("/GoogleLogin")
public class GoogleLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        String error = request.getParameter("error");

        if (error != null) {
            // Nếu có lỗi từ Google login, chuyển hướng đến trang đăng nhập.
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Lấy mã code và truy vấn thông tin người dùng từ Google
        GoogleServlet gg = new GoogleServlet();
        String accessToken = gg.getToken(code);
        GoogleAccount acc = gg.getUserInfo(accessToken);

        if (acc != null) {
            // Kiểm tra tài khoản người dùng trong cơ sở dữ liệu
            UserDAO userDao = null;
            try {
                userDao = new UserDAO();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            Users user = userDao.getAccountByEmailOrGoogleId(acc.getEmail(), acc.getId());

            if (user == null) {
                // Tạo tài khoản mới cho người dùng
                user = new Users();
                user.setTaiKhoan("google_" + acc.getId());
                user.setMatKhau(""); // Không cần mật khẩu
                user.setTenNguoiMua(acc.getName());
                user.setEmail(acc.getEmail());
                user.setChucVu("USER");
                user.setGoogleId(acc.getId());

                userDao.createUser(user);

//                 Chuyển hướng đến trang cập nhật tài khoản
                response.sendRedirect("updateTaiKhoan.jsp?googleId=" + acc.getId() + "&email=" + acc.getEmail());
                return;
            }


            // Đăng nhập và lưu vào session
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getID());
            session.setAttribute("tenNguoiMua", user.getTenNguoiMua());
            session.setAttribute("address", user.getDiaChi());
            session.setAttribute("phoneNumber", user.getSdt());
            session.setAttribute("role", user.getChucVu());

            // Chuyển hướng đến trang chủ
            response.sendRedirect("index.jsp");
        } else {
            // Nếu không lấy được thông tin người dùng, chuyển hướng lại trang đăng nhập
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ServletException | IOException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ServletException | IOException | SQLException e) {
            e.printStackTrace();
        }
    }
}
