package com.doan.Shop.Utils;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailSender {

    public static void sendEmail(String recipientEmail, String subject, String content) {
        final String username = "your-email@gmail.com"; // Thay bằng email Gmail của bạn
        final String password = "hjzulyhlffcpqxnt"; // Thay bằng mật khẩu ứng dụng đã tạo

        // Cấu hình SMTP của Gmail
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Tạo session và xác thực
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo một email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username)); // Email người gửi
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail)); // Email người nhận
            message.setSubject(subject); // Tiêu đề email
            message.setText(content); // Nội dung email

            // Gửi email
            Transport.send(message);

            System.out.println("Email đã được gửi thành công!");

        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Gửi email thất bại!");
        }
    }
}
