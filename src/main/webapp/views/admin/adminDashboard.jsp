<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.doan.Shop.DAO.ProductDAO, com.doan.Shop.Model.Products"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
// Lấy danh sách sản phẩm từ ProductDAO
ProductDAO productDAO = new ProductDAO();
List<Products> products = productDAO.getAllProducts();
request.setAttribute("products", products);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - Quản lý sản phẩm và đơn hàng</title>
<!-- Thêm CSS của Bootstrap 4 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Thêm CSS tùy chỉnh -->
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	color: #333;
}

.navbar {
	background-color: #000; /* Nền màu đen cho navbar */
}

.navbar-brand {
	color: #ffc107; /* Chữ vàng cho brand */
	font-weight: bold;
}

.navbar-nav .nav-link {
	color: #fff; /* Chữ trắng cho các mục */
	font-weight: bold;
}

.navbar-nav .nav-link:hover {
	color: #ffc107; /* Màu vàng khi hover */
}

.navbar-toggler-icon {
	background-color: #ffc107; /* Màu vàng cho icon menu */
}

.container {
	margin-top: 40px;
}

h1 {
	font-size: 2.5rem;
	font-weight: bold;
	text-align: center;
	color: #000;
}

table {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

th, td {
	text-align: center;
	padding: 12px;
}

th {
	background-color: #000; /* Nền đen cho các header */
	color: #fff; /* Chữ trắng cho header */
	font-size: 1.2rem;
}

td {
	font-size: 1rem;
	color: #333;
}

tr:hover {
	background-color: #ffc107; /* Màu vàng khi hover vào hàng */
	color: #fff;
}

.btn {
	font-size: 1rem;
	padding: 8px 15px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.btn-warning {
	background-color: #ffc107; /* Nền vàng cho nút sửa */
	color: #fff;
}

.btn-warning:hover {
	background-color: #e0a800; /* Màu vàng đậm khi hover */
}

.btn-danger {
	background-color: #dc3545; /* Nền đỏ cho nút xóa */
	color: #fff;
}

.btn-danger:hover {
	background-color: #c82333; /* Màu đỏ đậm khi hover */
}
</style>
</head>
<body>
	<div class="admin-home2">
		<!-- Thanh công cụ -->
		<!-- Thanh công cụ -->
		<div class="admin-nav">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">Admin Dashboard</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link btn text-white"
						href="RevenueServlet">Doanh thu</a></li>
					<li class="nav-item"><a class="nav-link btn text-white"
						href="OrderServlet">Xem Giao dịch</a></li>
					<li class="nav-item"><a class="nav-link btn text-white"
						href="UserControllerServlet?action=viewUserList">Xem Người
							dùng</a></li>
					<li class="nav-item"><a class="nav-link btn text-white"
						href="addProduct.jsp">Thêm sản phẩm</a></li>
					<li class="nav-item"><a class="nav-link btn text-white"
						href="login.jsp">Đăng xuất</a></li>
				</ul>
			</div>
		</nav>
</div>

		<!-- Nội dung quản lý sản phẩm -->
		<div class="container">
			<h1 class="my-4">Quản lý Sản phẩm</h1>

			<!-- Danh sách sản phẩm -->
			<h3 class="mt-4">Danh sách Sản phẩm</h3>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ID</th>
						<th>Tên sản phẩm</th>
						<th>Giá</th>
						<th>Mô tả</th>
						<th>Số lượng còn</th>
						<th>Hình ảnh</th>
						<th>Hành động</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${products}">
						<tr>
							<td>${product.id}</td>
							<td>${product.tenSanPham}</td>
							<td>${product.gia}</td>
							<td>${product.moTa}</td>
							<td>${product.soLuongCon}</td>
							<td><img
								src="${pageContext.request.contextPath}/${product.hinhAnh}"
								alt="${product.tenSanPham}"
								style="width: 80px; height: 80px; object-fit: cover;"></td>
							<td><a
								href="addProduct.jsp?id=${product.id}&tenSanPham=${product.tenSanPham}&gia=${product.gia}&moTa=${product.moTa}&soLuongCon=${product.soLuongCon}&hinhAnh=${product.hinhAnh}"
								class="btn btn-warning">Sửa</a> <a
								href="DeleteProductServlet?id=${product.id}"
								class="btn btn-danger"
								onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');">Xóa</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- Thêm jQuery và Bootstrap JS để hoạt động các hiệu ứng -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
