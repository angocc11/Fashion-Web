<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="dec" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
</head>
<body>
    <h2>Quên mật khẩu</h2>
    <form action="${pageContext.request.contextPath}/ForgotPasswordServlet" method="post">
        <label for="email">Nhập email của bạn:</label>
        <input type="email" id="email" name="email" placeholder="Nhập email của bạn" required>
        <button type="submit">Gửi mã xác minh</button>
    </form>

    <!-- Hiển thị lỗi hoặc thông báo -->
    <c:if test="${param.error == 'emailNotFound'}">
        <p style="color: red;">Email không tồn tại trong hệ thống.</p>
    </c:if>
    <c:if test="${param.error == 'emailFailed'}">
        <p style="color: red;">Không thể gửi email. Vui lòng thử lại.</p>
    </c:if>
</body>
</html>
