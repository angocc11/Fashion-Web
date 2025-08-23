<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.doan.Shop.Model.Orders, com.doan.Shop.Model.Order_items"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Update Password</title>
</head>
<body>
    <h1>Change your password</h1>
    <form action="updatePasswordHandler" method="POST">
        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required />
        <button type="submit">Update</button>
    </form>
    <p>Your password is currently set to the default value "123". Please update it for security.</p>
</body>
</html>
