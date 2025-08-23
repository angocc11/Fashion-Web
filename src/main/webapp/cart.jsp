<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.doan.Shop.Model.CartItem"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Giỏ hàng của bạn</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
</style>
</head>
<body>
	<div class="cart-page">
		<div class="container">
			<h2>Giỏ hàng của bạn</h2>
			<!-- Nút trở về trang chủ -->
			<a href="index.jsp" class="btn btn-secondary mb-3">Trở về trang
				chủ</a>

			<c:choose>
				<c:when test="${empty cartItems}">
					<p>Giỏ hàng của bạn hiện đang trống.</p>
				</c:when>
				<c:otherwise>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Hình ảnh</th>
								<th>Sản phẩm</th>
								<th>Giá</th>
								<th>Số lượng</th>
								<th>Thành tiền</th>
								<th>Hành động</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${cartItems}">
								<tr>
									<td><img
										src="${pageContext.request.contextPath}/${item.hinhAnh}"
										alt="${item.tenSanPham}"
										onerror="this.src='uploads/default.png'"></td>
									<td style="font-size: 22px;">${item.tenSanPham}</td>
									<td>${item.gia}VND</td>
									<td>
										<form action="CartControllerServlet" method="post"
											class="form-inline">
											<input type="hidden" name="action" value="updateQuantity">
											<input type="hidden" name="id" value="${item.id}"> <input
												type="number" name="soLuong" value="${item.soLuong}" min="1"
												onchange="this.form.submit()">
										</form>
									</td>
									<td>${item.soLuong * item.gia}VND</td>
									<td>
										<form action="CartControllerServlet" method="get"
											class="form-inline">
											<input type="hidden" name="action" value="removeFromCart">
											<input type="hidden" name="id" value="${item.id}">
											<button type="submit" class="btn btn-delete">Xóa</button>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<!-- Tách phần phương thức vận chuyển ra ô riêng -->
					<div class="shipping-container">
						<form action="CartControllerServlet?action=updateShipping"
							method="post" class="form-group">
							<label for="shipping">Chọn phương thức vận chuyển:</label> <select
								name="shipping" id="shipping" class="form-control" required>
								<option value="0" ${shippingCost == 0 ? 'selected' : ''}>Free
									Shipping (0 VND)</option>
								<option value="10000" ${shippingCost == 10000 ? 'selected' : ''}>Standard
									(10,000 VND)</option>
								<option value="20000" ${shippingCost == 20000 ? 'selected' : ''}>Express
									(20,000 VND)</option>
							</select>
							<button type="submit" class="btn btn-primary mt-3">Cập
								nhật</button>
						</form>
					</div>

					<!-- Hiển thị tổng tiền và phí ship -->
					<div class="total-container">
						<p class="total-label">
							Tổng tiền: <span>${totalAmount} VND</span>
						</p>
						<p class="shipping-label">
							Phí vận chuyển: <span>${shippingCost} VND</span>
						</p>
						<p class="grand-total-label">
							Tổng: <span>${totalWithShipping} VND</span>
						</p>
					</div>

					<!-- Nút Checkout -->
					<c:choose>
						<c:when test="${not empty cartItems}">
							<form action="CheckoutControllerServlet" method="get">
								<button type="submit" class="btn btn-checkout">Thanh
									toán</button>
							</form>
						</c:when>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
