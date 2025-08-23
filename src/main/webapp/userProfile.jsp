<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.doan.Shop.Model.Users"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
Users user = (Users) request.getAttribute("user");
String mode = (String) request.getAttribute("mode");
if (mode == null) mode = "view"; // Mặc định là chế độ xem
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Thông tin tài khoản</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="user-page">
		<div class="container">
			<h2 class="mt-4">Thông tin tài khoản</h2>

			<form id="editForm" action="UserControllerServlet?action=updateUserProfile" method="post" class="mt-3">
    <div class="form-group">
        <label for="tenNguoiMua">Tên người mua:</label>
        <input type="text" id="tenNguoiMua" name="tenNguoiMua"
               value="${user.tenNguoiMua}" class="form-control"
               ${mode == 'view' ? 'readonly' : ''} required>
    </div>
    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email"
               value="${user.email}" class="form-control"
               ${mode == 'view' ? 'readonly' : ''} required>
    </div>
    <div class="form-group">
        <label for="sdt">Số điện thoại:</label>
        <input type="text" id="sdt" name="sdt"
               value="${user.sdt}" class="form-control"
               ${mode == 'view' ? 'readonly' : ''} required>
    </div>
    <div class="form-group">
        <label for="diaChi">Địa chỉ:</label>
        <input type="text" id="diaChi" name="diaChi"
               value="${user.diaChi}" class="form-control"
               ${mode == 'view' ? 'readonly' : ''} required>
    </div>
    <p>Chế độ hiện tại: ${mode}</p>
    
    <!-- Hiển thị nút bấm dựa trên chế độ -->
    <c:choose>
    <c:when test="${mode == 'view'}">
        <a href="UserControllerServlet?action=viewUserProfile&mode=edit" class="btn btn-warning">Chỉnh sửa</a>
    </c:when>
    <c:when test="${mode == 'edit'}">
        <button type="submit" class="btn btn-success">Lưu thay đổi</button>
        <a href="UserControllerServlet?action=viewUserProfile&mode=view" class="btn btn-secondary">Hủy</a>
    </c:when>
</c:choose>

</form>

		</div>
	</div>
</body>
</html>
