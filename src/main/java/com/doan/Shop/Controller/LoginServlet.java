package com.doan.Shop.Controller;

import com.doan.Shop.DAO.DatabaseConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String googleId = request.getParameter("googleId");
        String email = request.getParameter("email"); 
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection connection = DatabaseConnection.initializeDatabase()) {
            if (googleId != null && !googleId.isEmpty()) {
                String query = "SELECT * FROM users WHERE googleId = ?";
                try (PreparedStatement ps = connection.prepareStatement(query)) {
                    ps.setString(1, googleId);

                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            // Người dùng đã có tài khoản, lưu thông tin vào session
                            int userId = rs.getInt("ID");
                            String role = rs.getString("ChucVu");
                            String tenNguoiMua = rs.getString("TenNguoiMua");
                            String address = rs.getString("DiaChi");
                            String phoneNumber = rs.getString("Sdt");

                            HttpSession session = request.getSession();
                            session.setAttribute("userId", userId);
                            session.setAttribute("tenNguoiMua", tenNguoiMua);
                            session.setAttribute("address", address);
                            session.setAttribute("phoneNumber", phoneNumber);
                            session.setAttribute("role", role);

                            // Nếu người dùng chưa cập nhật mật khẩu, chuyển đến trang update
                            if (rs.getString("MatKhau") == null || rs.getString("MatKhau").isEmpty()) {
                                response.sendRedirect(request.getContextPath() + "/updateTaiKhoan.jsp?googleId=" + googleId + "&email=" + email);
                            } else {
                                response.sendRedirect(request.getContextPath() + "/index.jsp");
                            }
                        } else {
                            // Nếu chưa có tài khoản, chuyển đến trang cập nhật
                            response.sendRedirect(request.getContextPath() + "/updateTaiKhoan.jsp?googleId=" + googleId + "&email=" + email);
                        }
                    }
                }
            } else {
                // Trường hợp đăng nhập bằng tài khoản truyền thống
                String query = "SELECT * FROM users WHERE TaiKhoan = ? AND MatKhau = ?";
                try (PreparedStatement ps = connection.prepareStatement(query)) {
                    ps.setString(1, username);
                    ps.setString(2, password);

                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            int userId = rs.getInt("ID");
                            String role = rs.getString("ChucVu");
                            String tenNguoiMua = rs.getString("TenNguoiMua");
                            String address = rs.getString("DiaChi");
                            String phoneNumber = rs.getString("Sdt");

                            HttpSession session = request.getSession();
                            session.setAttribute("userId", userId);
                            session.setAttribute("tenNguoiMua", tenNguoiMua);
                            session.setAttribute("address", address);
                            session.setAttribute("phoneNumber", phoneNumber);
                            session.setAttribute("role", role);

                            if ("ADMIN".equalsIgnoreCase(role)) {
                                response.sendRedirect(request.getContextPath() + "/adminDashboard.jsp");
                            } else {
                                response.sendRedirect(request.getContextPath() + "/index.jsp");
                            }
                        } else {
                            response.sendRedirect("login.jsp?error=invalid");
                        }
                    }
                }
            }
        } catch (SQLException e) {
                e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
