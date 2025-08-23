<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List, com.doan.Shop.Model.Products"%>

<script>
    function incrementViewCount(productId) {
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "ProductListServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("productId=" + productId);
    }
</script>

<!-- Tiêu đề trang -->
<c:choose>
    <c:when test="${not empty keyword}">
        <h2>Kết quả tìm kiếm cho: "${keyword}"</h2>
    </c:when>
    <c:when test="${not empty loaiSanPham}">
        <h2>Danh sách sản phẩm cho loại: "${loaiSanPham}"</h2>
    </c:when>
    <c:otherwise>
        <h2 class="tieude2">CÓ THỂ BẠN SẼ THÍCH</h2>
    </c:otherwise>
</c:choose>

<!-- Danh sách sản phẩm -->
<div class="product-list row">
    <c:forEach var="product" items="${products}">
        <div class="col-md-3 mb-4">
            <div class="card product-card shadow-sm">
                <!-- Hình ảnh sản phẩm -->
                <div class="product-image-container">
                    <img src="${pageContext.request.contextPath}/${product.hinhAnh}" class="card-img-top" alt="${product.tenSanPham}">
                    <!-- Nút Xem chi tiết sẽ được hiển thị khi hover vào hình ảnh -->
                    <div class="view-details-btn">
                        <a href="ProductDetailsServlet?ID=${product.id}" class="btn btn-view-details" onclick="incrementViewCount(${product.id})">Xem chi tiết</a>
                    </div>
                </div>
                <div class="card-body text-center">
                    <h5 class="card-title">${product.tenSanPham}</h5>
                    <p class="card-text text-danger">
                        <strong>${product.gia} VND</strong>
                    </p>

                    <!-- Các nút -->
                    <div class="product-buttons">
                        <!-- Nút Thêm vào giỏ hàng -->
                        <form action="CartControllerServlet" method="post" class="mt-2">
                            <input type="hidden" name="action" value="addToCart"> 
                            <input type="hidden" name="productId" value="${product.id}"> 
                            <input type="hidden" name="soLuong" value="1">
                            <button type="submit" class="btn btn-add-to-cart w-100">
                                <i class="fa fa-shopping-cart"></i> Thêm
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

    <c:if test="${empty products}">
        <p>Không tìm thấy sản phẩm nào.</p>
    </c:if>
</div>

<!-- Bootstrap & Custom Styles -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> <!-- Thêm FontAwesome -->

<style>
.tieude2 {
    text-align: center;
    margin-top: 50px;
    margin-bottom: 50px;
}

.product-card {
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
    transition: transform 0.3s ease;
}

/* Hiệu ứng hover */
.product-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Các nút */
.product-buttons .btn {
    width: 100%;
}

/* Kích thước hình ảnh sản phẩm */
.product-card img {
    object-fit: cover;
    height: 250px;
}

/* Bao bọc hình ảnh sản phẩm */
.product-image-container {
    position: relative;
    overflow: hidden;
}

/* Nút "Xem chi tiết" mặc định ẩn */
.view-details-btn {
    position: absolute;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%);
    opacity: 0;
    transition: opacity 0.3s ease;
    z-index: 10;
}

/* Hiệu ứng khi hover vào hình ảnh */
.product-image-container:hover .view-details-btn {
    opacity: 1;
}

/* Các hiệu ứng khác */
.product-card h5 {
    font-size: 1.2em;
    font-weight: bold;
    margin-bottom: 10px;
}

.product-card .text-danger {
    font-size: 1.1em;
    color: #e74c3c;
}

/* Tùy chỉnh màu sắc của nút "Xem chi tiết" */
.product-buttons .btn-view-details {
    background-color: #000;
    color: #fff;
    border: 1px solid #fff;
}

.product-buttons .btn-view-details:hover {
    background-color: #f1c40f;
    color: #000;
}

/* Tùy chỉnh màu sắc của nút "Thêm vào giỏ hàng" */
.product-buttons .btn-add-to-cart {
    background-color: #000;
    color: #fff;
    border: none;
}

.product-buttons .btn-add-to-cart:hover {
    background-color: #f1c40f;
    color: #000;
}

/* Thêm icon vào nút */
.product-buttons .fa-shopping-cart {
    margin-right: 10px;
}
</style>
