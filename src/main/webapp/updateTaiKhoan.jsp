
<%@ page import="java.util.List, com.doan.Shop.Model.Orders, com.doan.Shop.Model.Order_items"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cập nhật tài khoản</title>
</head>
<body>
    <h2>Cập nhật tài khoản và mật khẩu</h2>

    <!-- Hiển thị thông báo lỗi hoặc thành công -->
    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>
    <c:if test="${not empty message}">
        <p style="color:green;">${message}</p>
    </c:if>

    <form action="UpdateAccountServlet" method="post">
        <input type="hidden" name="googleId" value="${param.googleId}" />
        <input type="hidden" name="email" value="${param.email}" />
        
        <label for="username">Tài khoản:</label>
        <input type="text" id="username" name="username" required><br><br>

        <label for="password">Mật khẩu:</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="Cập nhật">
    </form>
</body>
</html>
