<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chi tiết sản phẩm</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
/* Custom Styling */
.ProDetail-page {
	background-color: #f8f9fa;
	padding: 30px 0;
}

.product-details {
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	padding: 25px;
	transition: box-shadow 0.3s ease, transform 0.3s ease;
}

.product-details:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

.product-image img {
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
	width: 100%;
	max-width: 250px;
	object-fit: cover;
	transition: transform 0.3s ease;
}

.product-image img:hover {
	transform: scale(1.05);
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
	border-radius: 25px;
	padding: 10px 20px;
	transition: background-color 0.3s ease;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #0056b3;
}

.form-control {
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	font-size: 1rem;
	padding: 12px;
	margin-bottom: 15px;
}
</style>
</head>
<body>
	<div class="ProDetail-page">
		<div class="product-detail-container">
			<!-- Phần hiển thị hình ảnh sản phẩm -->
			<div class="product-image-container">
				<img src="${pageContext.request.contextPath}/${product.hinhAnh}"
					alt="${product.tenSanPham}" onerror="this.src='images/default.png'"
					class="product-image">
			</div>

			<!-- Phần thông tin sản phẩm -->
			<div class="product-info-container">
				<h3>${product.tenSanPham}</h3>
				<p>
					<strong>Giá:</strong> ${product.gia} VND
				</p>
				<p>
					<strong>Mô tả:</strong> ${product.moTa}
				</p>

				<!-- Nút Thêm vào giỏ hàng -->
				<form action="CartControllerServlet" method="post" class="mt-2">
					<input type="hidden" name="action" value="addToCart"> 
					<input type="hidden" name="productId" value="${product.id}"> 
					<input type="hidden" name="soLuong" value="1">
					<button type="submit" class="btn btn-primary w-100">Thêm vào giỏ hàng</button>
				</form>
			</div>
		</div>
	</div>
	<p><strong>Đánh giá trung bình:</strong> ${averageRating} sao</p>
<p><strong>Số lượt đánh giá:</strong> ${reviewCount} đánh giá</p>
	
		<div class="review-form">
    <h4>Để lại đánh giá của bạn</h4>
    <form action="ProductReviewServlet" method="post">
    <input type="hidden" name="productId" value="${product.id}">
    <div class="form-group">
        <label for="rating">Đánh giá (1-5 sao):</label>
        <select name="rating" id="rating" class="form-control" required>
            <option value="">Chọn đánh giá</option>
            <option value="1">1 Sao</option>
            <option value="2">2 Sao</option>
            <option value="3">3 Sao</option>
            <option value="4">4 Sao</option>
            <option value="5">5 Sao</option>
        </select>
    </div>
    <div class="form-group">
        <label for="reviewText">Nhận xét:</label>
        <textarea name="reviewText" id="reviewText" rows="3" class="form-control" placeholder="Nhập nhận xét của bạn"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Gửi đánh giá</button>
</form>

</div>
		
		<!-- HIen thi danhh sach danh gia -->
		<div class="reviews-list mt-4">
    <h4>Đánh giá sản phẩm</h4>
    <c:forEach var="review" items="${productReviews}">
        <div class="review-item mb-3">
            <p><strong>Người dùng ${review.user_id}:</strong> ${review.rating} sao</p>
            <p>${review.review_text}</p>
            <small class="text-muted">Ngày đánh giá: ${review.review_date}</small>
        </div>
        <hr>
    </c:forEach>
    <c:if test="${empty productReviews}">
        <p>Chưa có đánh giá nào. Hãy là người đầu tiên đánh giá sản phẩm này!</p>
    </c:if>
</div>

</body>
</html>
