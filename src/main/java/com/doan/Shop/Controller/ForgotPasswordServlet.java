package com.doan.Shop.Controller;

import com.doan.Shop.DAO.DatabaseConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.*;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        // Kiểm tra nếu email không rỗng
        if (email == null || email.isEmpty()) {
            response.sendRedirect("views/web/forgotPassword.jsp?error=emailEmpty");
            return;
        }

        try (Connection connection = DatabaseConnection.initializeDatabase()) {
            String query = "SELECT * FROM users WHERE Email = ?";
            try (PreparedStatement ps = connection.prepareStatement(query)) {
                ps.setString(1, email);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        String verificationCode = generateVerificationCode();
                        sendVerificationEmail(email, verificationCode);

                        // Lưu thông tin vào session
                        HttpSession session = request.getSession();
                        session.setAttribute("verificationCode", verificationCode);
                        session.setAttribute("email", email);

                        // Chuyển hướng tới `verifyCode.jsp`
                        response.sendRedirect("views/web/verifyCode.jsp");
                    } else {
                        // Nếu email không tồn tại trong cơ sở dữ liệu
                        response.sendRedirect("views/web/forgotPassword.jsp?error=emailNotFound");
                    }
                }
            }
        } catch (SQLException | MessagingException e) {
            e.printStackTrace();
            // Nếu có lỗi trong quá trình xử lý email hoặc kết nối CSDL
            response.sendRedirect("views/web/forgotPassword.jsp?error=emailFailed");
        }
    }

    private String generateVerificationCode() {
        Random random = new Random();
        return String.valueOf(100000 + random.nextInt(900000)); // Mã 6 chữ số
    }

    private void sendVerificationEmail(String email, String verificationCode) throws MessagingException {
        String from = "buithianhngoccdag@gmail.com"; // Thay bằng email của bạn
        String password = "hjzu lyhl ffcp qxnt"; // Thay bằng mật khẩu ứng dụng

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Khởi tạo session gửi email
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        // Tạo message email
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
        message.setSubject("Password Reset Verification Code");
        message.setText("Your verification code is: " + verificationCode);

        // Gửi email
        Transport.send(message);
    }
}
