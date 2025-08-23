package com.doan.Shop.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doan.Shop.DAO.UserDAO;

@WebServlet("/UpdateAccountServlet")
public class UpdateAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String googleId = request.getParameter("googleId");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("error", "Tài khoản và mật khẩu không được để trống");
            request.getRequestDispatcher("/updateTaiKhoan.jsp").forward(request, response);
            return;
        }

        String plainPassword = password;

        try (UserDAO userDAO = new UserDAO()) {
            boolean updated = userDAO.updateGoogleUserCredentials(googleId, username, plainPassword);
            
            if (updated) {
                // Sau khi cập nhật thành công, chuyển hướng tới trang login
                request.setAttribute("message", "Bạn đã cập nhật tài khoản thành công!");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Cập nhật không thành công. Vui lòng thử lại.");
                request.getRequestDispatcher("/updateTaiKhoan.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi kết nối cơ sở dữ liệu, vui lòng thử lại sau.");
            request.getRequestDispatcher("/updateTaiKhoan.jsp").forward(request, response);
        }
    }
}
