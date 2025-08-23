<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.doan.Shop.Model.CartItem"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
    <h3>Đánh giá sản phẩm</h3>
    <form action="ProductReviewServlet" method="post">
        <input type="hidden" name="productId" value="${product.id}">

        <!-- Hệ thống đánh giá sao -->
        <div class="star-rating">
            <span class="star" data-value="1">&#9733;</span>
            <span class="star" data-value="2">&#9733;</span>
            <span class="star" data-value="3">&#9733;</span>
            <span class="star" data-value="4">&#9733;</span>
            <span class="star" data-value="5">&#9733;</span>
        </div>
        <!-- Input hidden để lưu giá trị đánh giá sao -->
        <input type="hidden" id="rating" name="rating" value="0"> 

        <p>Bạn đã chọn: <span id="selected-rating">0</span> sao</p>

        <div>
            <label for="reviewText">Nhận xét:</label>
            <textarea id="reviewText" name="reviewText" required>${requestScope.reviewText != null ? requestScope.reviewText : ''}</textarea>
        </div>
        <button type="submit">Gửi đánh giá</button>
    </form>
</div>

<style>
    /* CSS cho hệ thống đánh giá sao */
    .star-rating {
        display: inline-block;
        font-size: 2em;
        color: #ddd;
        cursor: pointer;
    }

    .star-rating .star:hover,
    .star-rating .star.hovered {
        color: #f5c518;
    }

    .star-rating .star.selected {
        color: #f5c518;
    }
</style>

<script>
    const stars = document.querySelectorAll('.star-rating .star');
    const ratingInput = document.getElementById('rating');
    const selectedRatingDisplay = document.getElementById('selected-rating');

    stars.forEach(star => {
        // Hiệu ứng khi di chuột qua sao
        star.addEventListener('mouseover', function() {
            resetStars();
            highlightStars(this.dataset.value);
        });

        // Khi người dùng nhấn vào một sao
        star.addEventListener('click', function() {
            ratingInput.value = this.dataset.value;
            selectedRatingDisplay.textContent = this.dataset.value; // Cập nhật số sao đã chọn
            selectStars(this.dataset.value);
        });

        // Khi di chuột ra khỏi sao
        star.addEventListener('mouseleave', function() {
            resetStars();
            selectStars(ratingInput.value); // Hiển thị lại các sao đã chọn
        });
    });

    // Hàm bỏ chọn tất cả các sao
    function resetStars() {
        stars.forEach(star => star.classList.remove('hovered', 'selected'));
    }

    // Hàm làm nổi bật các sao khi di chuột
    function highlightStars(rating) {
        stars.forEach(star => {
            if (star.dataset.value <= rating) {
                star.classList.add('hovered');
            }
        });
    }

    // Hàm chọn các sao đã được nhấn chọn
    function selectStars(rating) {
        stars.forEach(star => {
            if (star.dataset.value <= rating) {
                star.classList.add('selected');
            }
        });
    }
</script>
