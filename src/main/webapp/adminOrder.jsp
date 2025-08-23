<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.doan.Shop.Model.Orders, com.doan.Shop.Model.Order_items"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin - Quản lý Đơn hàng</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="admin-order">
		<div class="container">
			<h1 class="my-4">Danh sách Đơn hàng</h1>
			<!-- Nút trở về trang chủ -->
			<a href="adminDashboard.jsp" class="btn btn-secondary mb-3">Trở
				về trang chủ</a>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ID Đơn hàng</th>
						<th>ID Người mua</th>
						<th>Tổng số lượng</th>
						<th>Thành tiền</th>
						<th>Trạng thái</th>
						<th>Ngày mua</th>
						<th>Chi tiết đơn hàng</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="order" items="${orders}">
						<tr>
							<td>${order.getID()}</td>
							<td>${order.getID_NguoiMua()}</td>
							<td>${order.getTongSoLuong()}</td>
							<td>${order.getThanhTien()}</td>
							<td>
								<form action="OrderServlet" method="post">
									<input type="hidden" name="orderId" value="${order.getID()}" />
									<input type="hidden" name="action" value="updateStatus" />

									<!-- Kiểm tra nếu trạng thái là "Completed" hoặc "Cancelled" -->
									<c:choose>
										<c:when
											test="${order.getTrangThai() == 'Completed' || order.getTrangThai() == 'Cancelled'}">
											<!-- Hiển thị trạng thái dưới dạng văn bản -->
											<span>${order.getTrangThai()}</span>
										</c:when>
										<c:otherwise>
											<!-- Hiển thị dropdown chọn trạng thái nếu trạng thái không phải là "Completed" hoặc "Cancelled" -->
											<select name="newStatus" class="form-control">
												<option value="Pending"
													${order.getTrangThai() == 'Pending' ? 'selected' : ''}>Pending</option>
												<option value="Processing"
													${order.getTrangThai() == 'Processing' ? 'selected' : ''}>Processing</option>
												<option value="Shipped"
													${order.getTrangThai() == 'Shipped' ? 'selected' : ''}>Shipped</option>
												<option value="Completed"
													${order.getTrangThai() == 'Completed' ? 'selected' : ''}>Completed</option>
												<option value="Cancelled"
													${order.getTrangThai() == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
											</select>
											<button type="submit" class="btn btn-primary mt-2">Cập
												nhật</button>
										</c:otherwise>
									</c:choose>
								</form>
							</td>


							<td>${order.getNgayMua()}</td>
							<td>
								<button class="btn btn-info" type="button"
									data-toggle="collapse"
									data-target="#orderItems_${order.getID()}"
									aria-expanded="false"
									aria-controls="orderItems_${order.getID()}">Xem chi
									tiết</button>
							</td>
						</tr>

						<!-- Phần mở rộng hiển thị chi tiết sản phẩm trong đơn hàng -->
						<tr class="collapse" id="orderItems_${order.getID()}">
							<td colspan="7">
								<table class="table">
									<thead>
										<tr>
											<th>ID Sản phẩm</th>
											<th> Tên sản phẩm </th>
											<th>Số lượng</th>
											<th>Đơn giá</th>
										</tr>
									</thead>
									<tbody>
										<!-- Truy cập trực tiếp từ orderItemsMap -->
										<c:forEach var="item" items="${orderItemsMap[order.ID]}">
											<tr>
												<td>${item.product_id}</td>
												<!-- ID sản phẩm -->
												<td>${item.tenSanPham}</td>
												<!-- Tên sản phẩm -->
												<td>${item.soLuong}</td>
												<!-- Số lượng -->
												<td>${item.donGia}</td>
												<!-- Đơn giá -->
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</html>
