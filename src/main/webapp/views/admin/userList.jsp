<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Danh sách Người dùng</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="styles.css">
<!-- Liên kết đến tệp CSS đã chỉnh sửa -->
</head>
<body>
	<div class="admin-userlist">
		<div class="container">
			<h1 class="my-4">Danh sách Người dùng</h1>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ID</th>
						<th>Tên người dùng</th>
						<th>Email</th>
						<th>Vai trò</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${users}">
						<tr>
							<td>${user.ID}</td>
							<td>${user.tenNguoiMua}</td>
							<td>${user.email}</td>
							<td>${user.chucVu}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- Nút Trở về Trang Quản Trị -->
			<a href="adminDashboard.jsp" class="btn btn-secondary mt-3">Trở
				về trang chủ</a>
		</div>
	</div>
</body>
</html>
