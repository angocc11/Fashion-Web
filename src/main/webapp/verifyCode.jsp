<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="dec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Verify Code</title>
</head>
<body>
    <h2>Nhập mã xác minh</h2>
    <form action="${pageContext.request.contextPath}/ResetPasswordServlet" method="post">
        <label for="code">Mã xác minh:</label>
        <input type="text" id="code" name="verificationCode" required>
        <br>
        <label for="password">Mật khẩu mới:</label>
        <input type="password" id="password" name="password" required>
        <br>
        <button type="submit">Đặt lại mật khẩu</button>
    </form>

    <!-- Hiển thị thông báo lỗi -->
    <c:if test="${param.error == 'invalidCode'}">
        <p style="color: red;">Mã xác minh không hợp lệ.</p>
    </c:if>
    <c:if test="${param.error == 'emptyPassword'}">
        <p style="color: red;">Vui lòng nhập mật khẩu mới.</p>
    </c:if>
</body>
</html>
