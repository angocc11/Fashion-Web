<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Roboto', sans-serif;
	background-color: #f8f9fa;
	padding: 40px 0;
	font-size: 20px; /* Tăng kích thước chữ cho toàn bộ */
}

.checkout-container {
	max-width: 900px;
	margin: 0 auto;
	background-color: #ffffff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	box-sizing: border-box;
}

h1, h2 {
	font-size: 30px; /* Tăng kích thước chữ cho tiêu đề */
	color: #333;
	text-align: left;
	margin-bottom: 20px;
	padding-bottom: 5px;
	border-bottom: 2px solid #4CAF50;
}

}
.cart-item {
	display: flex;
	align-items: center; /* Căn giữa theo chiều dọc */
	margin-bottom: 20px;
	border-bottom: 1px solid #ddd;
	padding-bottom: 15px;
	width: 100%; /* Đảm bảo container có đủ không gian */
	box-sizing: border-box;
}

.cart-item img {
	width: 150px; /* Đảm bảo kích thước ảnh phù hợp */
	height: 150px;
	margin-right: 20px; /* Khoảng cách giữa ảnh và chi tiết sản phẩm */
	border-radius: 5px;
}

.cart-item-details {
	display: flex;
    flex-direction: column; /* Đặt các chi tiết sản phẩm theo chiều dọc */
    justify-content: space-between; /* Đảm bảo các chi tiết có khoảng cách đều */
    gap: 10px; /* Khoảng cách giữa các chi tiết */
    width: 100%;
}

.cart-item-name {
	font-size: 20px; /* Tăng kích thước chữ cho tên sản phẩm */
	color: #333;
	font-weight: 500;
}

.cart-item-price, .cart-item-quantity {
	font-size: 20px; /* Tăng kích thước chữ cho giá và số lượng */
	color: #555;
}

.cart-summary {
	margin-top: 20px;
	padding: 20px;
	background-color: #f9f9f9;
	border-radius: 8px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.cart-summary div {
	margin-bottom: 12px;
}

select, input[type="number"], input[type="text"], input[type="email"],
	textarea {
	padding: 12px;
	width: 100%;
	border: 1px solid #ddd;
	border-radius: 6px;
	font-size: 16px;
	margin-top: 6px;
	box-sizing: border-box;
}
select, input[type="number"],
	textarea {
	width: 35%;
}
textarea {
	resize: vertical;
	height: 120px;
	width:100%;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 15px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 100%;
	max-width: 250px;
	margin: 20px auto;
	font-size: 18px;
}

button:hover {
	background-color: #45a049;
}

.payment-method label {
	display: block;
	margin-bottom: 10px;
}

.payment-method input[type="radio"] {
	width: 80px; /* Đặt lại kích thước cho ô nhập số lượng */
	font-size: 16px;
	width: 35%;
	text-align: left; /* Căn văn bản về phía bên trái */
    margin-top: 20px;
}
.payment-method {
    text-align: left; /* Căn văn bản về phía bên trái */
    margin-top: 20px;
}
.summary-label {
	font-weight: 600;
	font-size: 20px;
}

#total-price, #shipping-cost, #total-cost {
	font-weight: normal; /* Đảm bảo không tô đen tổng tiền */
}

</style>
</head>
<body>
<div class="checkout-page">
	<div class="checkout-container">
		<!--  
		
			-->
			<!-- Giỏ hàng -->
			<h2 class="giohang_lable">Giỏ Hàng</h2>
			<c:set var="totalAmount" value="0" />
			<c:forEach var="item" items="${sessionScope.cartItems}">
				<div class="cart-item">
					<img src="${pageContext.request.contextPath}/${item.hinhAnh}"
						alt="product-image">
					<div class="cart-item-details">
						<div class="cart-item-name">${item.tenSanPham}</div>
						<div class="cart-item-price">Giá: ${item.gia} VND</div>
						<div class="cart-item-quantity">
							<label for="quantity${item.id}">Số lượng:</label> <input
								type="number" id="quantity${item.id}" name="quantity${item.id}"
								value="${item.soLuong}" min="1" step="1" onchange="updateCart()"
								required>
						</div>
					</div>
				</div>
				<c:set var="totalAmount"
					value="${totalAmount + item.soLuong * item.gia}" />
			</c:forEach>

			<!-- Tính toán tổng tiền và phí vận chuyển -->
			<c:set var="shippingCost"
				value="${shippingCost != null ? shippingCost : 10000}" />
			<div class="cart-summary">
				<div>
					<span class="summary-label">Phương thức vận chuyển:</span> <select
						id="shipping-method" name="shipping-method"
						onchange="updateCart()" required>
						<option value="000" ${shippingCost == 000 ? 'selected' : ''}>Free(0
							VND)</option>
						<option value="10000" ${shippingCost == 10000 ? 'selected' : ''}>Giao
							hàng tiêu chuẩn (10,000 VND)</option>
						<option value="20000" ${shippingCost == 20000 ? 'selected' : ''}>Giao
							hàng nhanh (20,000 VND)</option>
					</select>
				</div>
				<div>
					<span id="total-price" class="summary-label">Tổng tiền:
						${totalAmount} VND</span>
				</div>
				<div>
					<span id="shipping-cost" class="summary-label">Phí vận
						chuyển: ${shippingCost} VND</span>
				</div>
				<div>
					<span id="total-cost" class="summary-label">Tổng cộng:
						${totalAmount + shippingCost} VND</span>
				</div>
			</div>

			<!-- Phương thức thanh toán -->
			<h2 class="thanhtoan_lable">Hình Thức Thanh Toán</h2>
			<div class="payment-method">
				<label><input type="radio" name="payment-method" value="cod"
					${paymentMethod == 'cod' ? 'checked' : ''} required> Thanh
					toán khi nhận hàng (COD)</label> <label><input type="radio"
					name="payment-method" value="bank-transfer"
					${paymentMethod == 'bank-transfer' ? 'checked' : ''} required>
					Chuyển khoản ngân hàng (Quét mã QR)</label>
			</div>

		<form action="ConfirmOrderServlet" method="post">
    <button type="submit" class="btn btn-primary">THANH TOÁN</button>
</form>

</form>
		
		</form>
	</div>
</div>
	<script>
		function updateCart() {
			let totalAmount = 0;
			document
					.querySelectorAll('.cart-item')
					.forEach(
							function(item) {
								let price = parseInt(item
										.querySelector('.cart-item-price').textContent
										.replace('Giá: ', '').replace(' VND',
												''));
								let quantity = parseInt(item
										.querySelector('.cart-item-quantity input').value);
								totalAmount += price * quantity;
							});
			let shippingCost = parseInt(document
					.getElementById('shipping-method').value);
			let totalCost = totalAmount + shippingCost;
			document.getElementById('total-price').textContent = 'Tổng tiền: '
					+ totalAmount + ' VND';
			document.getElementById('shipping-cost').textContent = 'Phí vận chuyển: '
					+ shippingCost + ' VND';
			document.getElementById('total-cost').textContent = 'Tổng cộng: '
					+ totalCost + ' VND';
		}

		window.onload = updateCart;
	</script>
</body>
</html>
