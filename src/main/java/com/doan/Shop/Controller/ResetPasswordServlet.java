package com.doan.Shop.Controller;

import com.doan.Shop.DAO.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String verificationCode = request.getParameter("verificationCode");
        String newPassword = request.getParameter("password");

        HttpSession session = request.getSession();
        String sessionCode = (String) session.getAttribute("verificationCode");
        String email = (String) session.getAttribute("email");

        if (sessionCode == null || !sessionCode.equals(verificationCode)) {
            response.sendRedirect("views/web/verifyCode.jsp?error=invalidCode");
            return;
        }

        if (newPassword == null || newPassword.trim().isEmpty()) {
            response.sendRedirect("views/web/verifyCode.jsp?error=emptyPassword");
            return;
        }

        try (Connection connection = DatabaseConnection.initializeDatabase()) {
            String query = "UPDATE users SET MatKhau = ? WHERE Email = ?";
            try (PreparedStatement ps = connection.prepareStatement(query)) {
            	ps.setString(1, newPassword);
                ps.setString(2, email);

                int rowsUpdated = ps.executeUpdate();
                if (rowsUpdated > 0) {
                    response.sendRedirect("login.jsp?message=resetSuccess");
                } else {
                    response.sendRedirect("views/web/verifyCode.jsp?error=emailNotFound");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
