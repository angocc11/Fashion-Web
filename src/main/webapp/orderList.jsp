<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.doan.Shop.Model.Orders, com.doan.Shop.Model.Order_items"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Danh sách Đơn hàng</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1 class="my-4">Danh sách Đơn hàng</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID Đơn hàng </th>
					<th>ID Người mua</th>
					<th>Tổng số lượng</th>
					<th>Thành tiền</th>
					<th>Trạng thái</th>
					<th>Ngày mua</th>
					<th>Chi tiết đơn hàng</th>
				</tr>
			</thead>
			<c:forEach var="order" items="${orders}">
				<tr>
					<td>${order.id}</td>
					<td>${order.idNguoiMua}</td>
					<td>${order.tongSoLuong}</td>
					<td>${order.thanhTien}</td>
					<td>${order.trangThai}</td>
					<td>${order.ngayMua}</td>
					<td>
						<button class="btn btn-info" type="button" data-toggle="collapse"
							data-target="#orderItems_${order.id}" aria-expanded="false"
							aria-controls="orderItems_${order.id}">Xem chi tiết</button>
					</td>
				</tr>
				<tr class="collapse" id="orderItems_${order.id}">
					<td colspan="7">
						<table class="table">
							<thead>
								<tr>
									<th>ID</th>
									<th>Tên Sản phẩm</th>
									<!-- Đổi tên cột thành Tên Sản phẩm -->
									<th>Số lượng</th>
									<th>Đơn giá</th>
								</tr>
							</thead>
							<tbody>
								<!-- Sử dụng orderItemsMap để lấy danh sách items cho từng order -->
								<c:forEach var="item" items="${orderItemsMap[order.id]}">
									<tr>
										<td>${item.id}</td>
										<td>${item.tenSanPham}</td>
										<td>${item.soLuong}</td>
										<td>${item.donGia}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</td>
				</tr>
			</c:forEach>

		</table>
	</div>
</body>
</html>
