<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Molla - Bootstrap eCommerce Template</title>
<meta name="keywords" content="HTML5 Template">
<meta name="description" content="Molla - Bootstrap eCommerce Template">
<meta name="author" content="p-themes">
<!-- Favicon -->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="apple-touch-icon" sizes="180x180"
	href="<c:url value='/template/web/assets/images/icons/apple-touch-icon.png' />">
<link rel="icon" type="image/png" sizes="32x32"
	href="<c:url value='/template/web/assets/images/icons/favicon-32x32.png' />">
<link rel="icon" type="image/png" sizes="16x16"
	href="<c:url value='/template/web/assets/images/icons/favicon-16x16.png' />">
<link rel="manifest"
	href="<c:url value='/template/web/assets/images/icons/site.html' />">
<link rel="mask-icon"
	href="<c:url value='/template/web/assets/images/icons/safari-pinned-tab.svg' />"
	color="#666666">
<link rel="shortcut icon"
	href="<c:url value='/template/web/assets/images/icons/favicon.ico' />">
<meta name="apple-mobile-web-app-title" content="Molla">
<meta name="application-name" content="Molla">
<meta name="msapplication-TileColor" content="#cc9966">
<meta name="msapplication-config"
	content="<c:url value='/template/web/assets/images/icons/browserconfig.xml' />">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet"
	href="<c:url value='/template/web/assets/vendor/line-awesome/line-awesome/line-awesome/css/line-awesome.min.css' />">
<!-- Plugins CSS File -->
<link rel="stylesheet"
	href="<c:url value='/template/web/assets/css/bootstrap.min.css' />">
<link rel="stylesheet"
	href="<c:url value='/template/web/assets/css/plugins/owl-carousel/owl.carousel.css' />">
<link rel="stylesheet"
	href="<c:url value='/template/web/assets/css/plugins/magnific-popup/magnific-popup.css' />">
<link rel="stylesheet"
	href="<c:url value='/template/web/assets/css/plugins/jquery.countdown.css' />">
<!-- Main CSS File -->
<link rel="stylesheet"
	href="<c:url value='/template/web/assets/css/style.css' />">
<link rel="stylesheet"
	href="<c:url value='/template/web/assets/css/skins/skin-demo-3.css' />">
<link rel="stylesheet"
	href="<c:url value='/template/web/assets/css/demos/demo-3.css' />">
<style type="text/css">
.body-container {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.user-header .header {
    background-color: #000; /* Nền màu đen */
    color: #fff; /* Chữ màu trắng */
    font-family: Arial, sans-serif; /* Font chữ */
}
.header .logo {
	float: left;
	margin-top: 40px;
	margin-left: -30px;
	margin-right: 30px;
}

.header .logo img {
	height: 30px; /* Đặt kích thước logo */
}
.user-header .menu-list {
    list-style: none; /* Xóa dấu chấm của danh sách */
    padding: 0;
    margin: 0;
    display: flex; /* Sử dụng flex để hiển thị menu ngang */
    justify-content: center; /* Căn giữa các menu */
    margin-top: 10px;
}

.user-header .menu-list li {
    margin: 0 20px; /* Khoảng cách giữa các menu */
    position: relative;
}

.user-header .menu-list li a {
    text-decoration: none; /* Xóa gạch chân */
    color: #fff; /* Màu chữ trắng */
    font-size: 16px;
    font-weight: normal; /* Chữ đậm */
    padding: 10px 15px;
    transition: color 0.3s ease;
}

.user-header .menu-list li a:hover {
    color: #FFD700; /* Màu vàng khi hover */
}
.user-header .header-right {
    float: right;
    margin-right: 30px;
    display: flex;
    align-items: center;
}

.user-header .header-right .icon {
    margin-left: 20px; /* Khoảng cách giữa các icon */
    font-size: 20px;
    cursor: pointer;
    color: #fff;
}

.user-header .header-right .icon:hover {
    color: #FFD700; /* Màu vàng khi hover */
}

.user-header .dropdown {
    position: relative; /* Để có thể hiển thị dropdown content */
}

.user-header .dropdown-content {
    display: none; /* Ẩn menu con */
    position: absolute;
    top: 100%; /* Đặt dropdown xuống dưới menu */
    left: 0;
    padding: 10px;
    border-radius: 5px;
    z-index: 1;
    width:200px;
}

.user-header .dropdown:hover .dropdown-content {
    display: block; /* Hiển thị dropdown khi hover vào "SẢN PHẨM" */
}

.user-header .form-control {
    padding: 8px 12px;
    width: 200px;
    border-radius: 5px;
    border: 1px solid #ccc;
}
/* Phần giỏ hàng và trang cá nhân */
.user-header .header-right {
    float: right;
    margin-right: 30px;
    display: flex;
    align-items: center;
}

/* Các icon trong header */
.user-header .header-right .icon {
    margin-left: 20px; /* Khoảng cách giữa các icon */
    font-size: 20px;
    cursor: pointer;
}

/* Màu khi hover */
.user-header .header-right .icon:hover {
    color: #FFD700; /* Màu vàng khi hover */
}
.user-header .search-container {
    width: 100%;
    /* Chiều rộng của container tìm kiếm chiếm toàn bộ màn hình */
    text-align: center; /* Căn giữa nội dung bên trong container */
    margin-top: 15px; /* Khoảng cách từ menu đến thanh tìm kiếm */
    margin-bottom: 0px;
    padding-bottom: 30px;
}

.user-header .search-bar {
    width: 50%; /* Chiều rộng thanh tìm kiếm (có thể thay đổi) */
    padding: 10px;
    border-radius: 25px;
    border: 1px solid #ccc;
    font-size: 16px;
    outline: none;
}
.user-header .search-button {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    background-color: transparent;
    border: none;
    cursor: pointer;
    font-size: 18px;
    color: #333;
}

.user-header .search-button:hover {
    color: #FFD700; /* Màu vàng khi hover */
}

.user-header .search-icon {
    position: absolute;
    right: 10px; /* Đặt icon ở bên phải */
    top: 50%;
    transform: translateY(-50%); /* Căn giữa theo chiều dọc */
    font-size: 18px;
    color: #333;
    cursor: pointer;
}

.user-header .search-bar:focus+.search-icon {
    color: #FFD700; /* Đổi màu icon khi ô tìm kiếm được focus */
}

.user-header .search-bar:hover+.search-icon {
    color: #FFD700; /* Đổi màu icon khi hover */
}
.user-header .fa, .user-header .icon {
    color: #fff !important;
}

.user-header .icon:hover, .user-header .fa:hover {
    color: #FFD700 !important;
}

.container {
	flex-grow: 1;
}

.footer-container {
	margin-top: 0px; /* Tạo khoảng cách giữa nội dung và footer */
	padding: 0px;
	/*background-color: #333; /* Màu nền cho footer */
	/*color: white;*/
	text-align: center;
}


.cart-page .btn-delete {
	background-color: #333; /* Màu đen */
	color: white;
	border: 1px solid #333;
	padding: 12px 20px;
	border-radius: 5px;
	font-size: 16px;
	transition: background-color 0.3s, transform 0.2s;
}

.cart-page .btn-delete:hover {
	background-color: #444; /* Tối hơn khi hover */
	transform: scale(1.05); /* Phóng to nhẹ khi hover */
}

.cart-page .btn-update {
	background-color: #f8c145; /* Màu vàng */
	color: white;
	border: 1px solid #e0a800;
	padding: 12px 20px;
	border-radius: 5px;
	font-size: 16px;
	transition: background-color 0.3s, transform 0.2s;
}

.cart-page .btn-update:hover {
	background-color: #e0a800; /* Màu vàng đậm hơn khi hover */
	transform: scale(1.05); /* Phóng to nhẹ khi hover */
}

.cart-page .btn-checkout {
	background-color: white; /* Màu trắng */
	color: #333;
	border: 1px solid #333;
	padding: 12px 20px;
	border-radius: 5px;
	font-size: 16px;
	transition: background-color 0.3s, transform 0.2s;
}

.cart-page .btn-checkout:hover {
	background-color: #f8f9fa; /* Màu trắng nhạt khi hover */
	transform: scale(1.05); /* Phóng to nhẹ khi hover */
}

/* Body và các phần chung */
.cart-page body {
	background-color: #f8f9fa;
	padding-top: 20px;
}

.cart-page .container {
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 30px;
}

.cart-page h2 {
	color: #333;
	font-weight: normal; /* Không tô đậm */
	font-size: 30px; /* Giảm 1px */
	text-align: center; /* Căn giữa tiêu đề */
}

.cart-page table th, .cart-page table td {
	vertical-align: middle;
	font-size: 18px; /* Giảm 1px */
}

.cart-page .btn-custom {
	margin-top: 25px;
	background-color: #f1c40f;
	color: black;
}

.cart-page .btn-custom:hover {
	background-color: #f39c12;
	color: white;
}

.cart-page .btn-danger {
	background-color: #e74c3c;
	color: white;
}

.cart-page .btn-danger:hover {
	background-color: #c82333;
}

.cart-page .form-group label {
	font-weight: normal; /* Không tô đậm */
	font-size: 18px; /* Giảm 1px */
}

.cart-page .table img {
	width: 100%; /* Đảm bảo hình ảnh vừa đủ khung */
	max-width: 150px; /* Đặt giới hạn max-width */
	height: auto;
	object-fit: cover;
	transition: transform 0.3s ease; /* Thêm hiệu ứng */
}

.cart-page .table img:hover {
	transform: scale(1.05); /* Tạo hiệu ứng phóng to hình ảnh */
}

.cart-page .form-inline input[type="number"] {
	width: 100px;
	text-align: center; /* Căn giữa chữ số */
}

.cart-page .shipping-container {
	background-color: #f1f1f1;
	border: 1px dashed #ddd; /* Đổi đường viền thành đường cắt đứt */
	padding: 20px;
	margin-top: 30px;
	border-radius: 8px;
}

.cart-page .shipping-container select {
	font-size: 14px; /* Giảm 1px */
	padding: 10px;
	border-radius: 4px;
	width: 220px;
	height: 50px;
}

.cart-page .shipping-container button {
	margin-top: 10px;
}

.cart-page .total-container {
	background-color: #f8f9fa;
	padding: 20px;
	margin-top: 20px;
	border-radius: 8px;
	border: 1px dashed #ddd; /* Đổi đường viền thành đường cắt đứt */
}
/* Chỉnh phần Tổng tiền */
.cart-page .total-container .total-label {
	font-size: 19px;
	font-weight: normal; /* Không tô đậm */
}

/* Chỉnh phần Phí vận chuyển */
.cart-page .total-container .shipping-label {
	font-size: 19px;
	font-weight: normal; /* Không tô đậm */
}

/* Chỉnh phần Tổng (Grand Total) */
.cart-page .total-container .grand-total-label {
	font-size: 19px;
	font-weight: normal; /* Không tô đậm */
}

/* Nếu bạn muốn phần số tiền (value) có thể có kiểu chữ khác */
.cart-page .total-container span {
	font-weight: normal; /* Làm đậm phần số tiền */
}

.cart-page .total-container p {
	font-size: 20px; /* Giảm 1px */
}

.cart-page .btn-delete, .cart-page .btn-checkout {
	width: 100%; /* Đảm bảo nút kéo dài hết chiều rộng */
	max-width: 200px; /* Giới hạn chiều rộng */
	margin: 10px auto; /* Căn giữa nút */
}

.cart-page .btn-update {
	width: 100%; /* Đảm bảo nút kéo dài hết chiều rộng */
	max-width: 250px; /* Giới hạn chiều rộng */
	margin: 10px auto; /* Căn giữa nút */
}

.cart-page .btn-custom, .cart-page .btn-danger {
	transition: background-color 0.3s ease, color 0.3s ease;
}

.cart-page .btn-custom:hover {
	background-color: #28a745;
	color: white;
}

.cart-page .btn-danger:hover {
	background-color: #c82333;
}

.checkout-page body {
	background-color: #f8f9fa;
	padding: 40px 0;
	font-size: 14px; /* Giảm kích thước chữ 2px */
}

.checkout-page .checkout-container {
	max-width: 900px;
	margin: 0 auto;
	background-color: #ffffff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	box-sizing: border-box;
}

.checkout-page h1, .checkout-page h2 {
	font-size: 28px; /* Giảm kích thước chữ 2px */
	color: #333;
	text-align: left;
	margin-bottom: 20px;
	padding-bottom: 5px;
	border-bottom: 2px solid #4CAF50;
}

.checkout-page .cart-item {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
	border-bottom: 1px solid #ddd;
	padding-bottom: 15px;
	width: 100%;
	box-sizing: border-box;
	gap: 20px; /* Thêm khoảng cách giữa ảnh và các thông tin */
}

.checkout-page .cart-item img {
	width: 120px; /* Điều chỉnh kích thước ảnh nhỏ hơn */
	height: 120px;
	border-radius: 8px;
}

.checkout-page .cart-item-details {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	width: 100%;
}

.checkout-page .cart-item-name {
	font-size: 16px; /* Giảm kích thước chữ 2px */
	color: #333;
	font-weight: 500;
}

.checkout-page .cart-item-price, .checkout-page .cart-item-quantity {
	font-size: 14px; /* Giảm kích thước chữ 2px */
	color: #555;
}

.checkout-page .cart-summary {
	margin-top: 20px;
	padding: 20px;
	background-color: #f9f9f9;
	border-radius: 8px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.checkout-page .cart-summary div {
	margin-bottom: 12px;
}

.checkout-page select, .checkout-page input[type="number"],
	.checkout-page input[type="text"], .checkout-page input[type="email"],
	.checkout-page textarea {
	padding: 12px;
	width: 100%;
	border: 1px solid #ddd;
	border-radius: 6px;
	font-size: 14px; /* Giảm kích thước chữ 2px */
	margin-top: 6px;
	box-sizing: border-box;
}

.checkout-page select, .checkout-page input[type="number"] {
	width: 35%;
}

.checkout-page button {
	background-color: #4CAF50;
	color: white;
	padding: 15px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 100%;
	max-width: 250px;
	margin: 20px auto;
	font-size: 16px; /* Giảm kích thước chữ 2px */
}

.checkout-page button:hover {
	background-color: #45a049;
}

.checkout-page .payment-method label {
	display: block;
	margin-bottom: 10px;
}

.checkout-page .payment-method input[type="radio"] {
	width: 80px;
	font-size: 14px; /* Giảm kích thước chữ 2px */
	width: 5%;
	text-align: left;
	margin-top: 20px;
}

.checkout-page .payment-method {
	text-align: left;
	margin-top: 20px;
}

.checkout-page .summary-label {
	font-weight: 600;
	font-size: 16px; /* Giảm kích thước chữ 2px */
}

.checkout-page #total-price, .checkout-page #shipping-cost,
	.checkout-page #total-cost {
	font-weight: normal;
}

.checkout-page .giohang_lable {
	margin-top: 20px;
	margin-bottom: 20px;
}

.checkout-page .thanhtoan_lable {
	margin-top: 20px;
}

.user-page body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f4f9fc;
	padding-top: 40px;
}

.user-page .container {
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
	padding: 35px;
	margin-bottom: 40px;
	transition: all 0.3s ease;
}

.user-page h2 {
	color: #2c78c9;
	text-align: center;
	font-size: 28px;
	margin-bottom: 20px;
	font-weight: 500;
}

.user-page .table {
	width: 50%;
	border-collapse: collapse;
	margin-bottom: 25px;
}

.user-page .table th, .user-page .table td {
	text-align: left;
	padding: 12px;
	font-size: 14px;
}

.user-page .table th {
	background-color: #3a8cc1;
	color: white;
	border-radius: 8px;
}

.user-page .table td {
	background-color: #f9fafb;
	color: #666;
}

/* Chỉnh sửa các ô thông tin tài khoản với đường viền */
.user-page .info-container {
	display: flex;
	flex-direction: column;
	gap: 15px;
	margin-bottom: 25px;
	width: 70%; /* Chiều rộng không thay đổi */
	margin-left: auto; /* Căn giữa theo chiều ngang */
	margin-right: auto; /* Căn giữa theo chiều ngang */
}

.user-page form {
	display: flex;
	flex-direction: column;
	gap: 15px;
	margin-bottom: 25px;
	width: 70%; /* Chiều rộng của form */
	margin-left: auto; /* Căn giữa theo chiều ngang */
	margin-right: auto; /* Căn giữa theo chiều ngang */
}

.user-page .info-item {
	display: flex;
	align-items: center;
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 8px 12px;
	background-color: #f9fafb;
	justify-content: space-between;
	/* Căn tên trường và dữ liệu lại gần nhau */
}

.user-page .info-item .info-label {
	font-weight: bold;
	color: #333;
	margin-right: 15px; /* Giảm khoảng cách giữa tên trường và dữ liệu */
	/*flex: 1; /* Tên trường chiếm 1 phần diện tích */
}

.user-page .info-item .info-data {
	color: #666;
	font-size: 14px;
	flex: 2; /* Dữ liệu người dùng chiếm phần diện tích còn lại */
}

.user-page .info-item:nth-child(even) {
	background-color: #f4f6f9;
	/* Đổi màu nền cho các dòng chẵn để dễ nhìn */
}

.user-page .btn {
	border-radius: 30px;
	font-size: 15px;
	padding: 10px 28px;
	font-weight: 500;
	transition: all 0.3s ease;
}

.user-page .btn-warning {
	background-color: #f0b500;
	color: white;
}

.user-page .btn-warning:hover {
	background-color: #e0a500;
	transform: scale(1.05);
}

.user-page .btn-primary {
	background-color: #4a90e2;
	color: white;
}

.user-page .btn-primary:hover {
	background-color: #357ab7;
	transform: scale(1.05);
}

.user-page .btn-success {
	background-color: #6bbf4d;
	color: white;
}

.user-page .btn-success:hover {
	background-color: #5ba743;
	transform: scale(1.05);
}

.user-page .form-control {
	border-radius: 8px;
	font-size: 16px;
	padding: 12px 18px;
	margin-bottom: 15px;
	background-color: #f3f6f9;
	border: 1px solid #ddd;
}

.user-page .form-control:focus {
	border-color: #4a90e2;
	box-shadow: 0 0 5px rgba(74, 144, 226, 0.4);
}

.user-page .form-group label {
	font-weight: 600;
	color: #555;
}

.user-page .text-center a {
	font-size: 16px;
	text-decoration: none;
	color: #4a90e2;
	transition: all 0.3s ease;
}

.user-page .text-center a:hover {
	text-decoration: underline;
	color: #357ab7;
}

.user-page .card {
	border: none;
	background-color: #f9fafb;
	margin-top: 30px;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 6px 14px rgba(0, 0, 0, 0.1);
}

.user-page .card-body {
	padding: 0;
}

.ProDetail-page {
	background-color: #f8f9fa;
	padding: 40px 0;
}

.ProDetail-page .product-detail-container {
	display: flex;
	gap: 30px;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	padding: 35px;
	transition: box-shadow 0.3s ease, transform 0.3s ease;
}

.ProDetail-page .product-detail-container:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

/* Phần hiển thị hình ảnh sản phẩm */
.ProDetail-page .product-image-container {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
}

.ProDetail-page .product-image img {
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
	width: 100%;
	max-width: 300px;
	object-fit: cover;
	transition: transform 0.3s ease;
}

.ProDetail-page .product-image img:hover {
	transform: scale(1.05);
}

/* Phần thông tin sản phẩm */
.ProDetail-page .product-info-container {
	flex: 2;
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.ProDetail-page .product-info-container h3 {
	font-size: 5rem; /* Tăng kích thước tiêu đề */
	color: #333;
}

.ProDetail-page .product-info-container p {
	font-size: 1.8rem; /* Tăng kích thước mô tả */
	color: #555;
}

.ProDetail-page .product-info-container strong {
	font-weight: bold;
}

/* Phần đánh giá sản phẩm */
.ProDetail-page .review-section {
	background-color: #f1f1f1;
	padding: 20px;
	margin-top: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.ProDetail-page .review-section h4 {
	margin-bottom: 15px; /* Giảm khoảng cách dưới tiêu đề */
}

.ProDetail-page .review p {
	margin-bottom: 5px; /* Giảm khoảng cách dưới mỗi đoạn văn */
	color: #555;
	font-size: 14px; /* Điều chỉnh kích thước chữ nếu cần */
}

.ProDetail-page .review strong {
	color: #333;
}

/* Tối ưu khoảng cách giữa các sao */
.ProDetail-page .star-rating {
	display: flex;
	justify-content: center;
	margin-bottom: 10px; /* Giảm khoảng cách dưới phần sao */
}

.ProDetail-page .star-rating input {
	display: none;
}

.ProDetail-page .star-rating label {
	font-size: 2rem;
	color: #ccc;
	cursor: pointer;
	transition: color 0.3s ease;
	margin-right: 5px; /* Giảm khoảng cách giữa các sao */
}

.ProDetail-page .star-rating input:checked ~ label {
	color: #ffc107;
}

.ProDetail-page .star-rating label:hover, .ProDetail-page .star-rating input:focus 
	 ~ label {
	color: #ffdd57;
}

.ProDetail-page .selected-rating-text {
	font-size: 14px; /* Điều chỉnh kích thước chữ của thông báo đánh giá */
	margin-bottom: 10px; /* Giảm khoảng cách dưới thông báo */
}

/* Giảm khoảng cách giữa các ô nhập liệu và nút submit */
.ProDetail-page textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px; /* Giảm khoảng cách dưới các ô nhập liệu */
	font-size: 14px;
	border-radius: 5px;
}

.ProDetail-page .submit-btn {
	background-color: #ffc107; /* Màu vàng */
	color: #333; /* Màu chữ đen */
	border: none;
	padding: 10px 20px;
	font-size: 14px;
	border-radius: 5px;
	cursor: pointer;
}

.ProDetail-page .submit-btn:hover {
	background-color: #e0a800; /* Màu vàng đậm khi hover */
	color: white; /* Màu chữ trắng khi hover */
}

/* Cải thiện khoảng cách giữa các phần tử trong form */
.ProDetail-page form {
	margin-bottom: 20px;
}

.order-page body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	color: #333;
}

.order-page .container {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin-top: 30px;
}

.order-page h1 {
	color: #333;
	font-size: 2.5rem;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
}

/* Bảng đơn hàng */
.order-page .table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 20px;
}

.order-page .table th, .order-page .table td {
	padding: 12px;
	text-align: center;
	font-size: 1.1rem;
	border-bottom: 1px solid #ddd;
}

.order-page .table-striped tbody tr:nth-of-type(odd) {
	background-color: #f9f9f9;
}

.order-page .table th {
	background-color: #000; /* Đen */
	color: #fff; /* Chữ trắng */
	font-weight: bold;
}

.order-page .table td {
	color: #555;
}

/* Nút "Xem chi tiết" */
.order-page .btn-info {
	background-color: #000; /* Background đen */
	color: #fff; /* Chữ trắng */
	border: none;
	border-radius: 5px;
	padding: 8px 15px;
	transition: background-color 0.3s ease, transform 0.3s ease;
}

.order-page .btn-info:hover {
	background-color: #ffc107; /* Màu vàng khi hover */
	color: #000; /* Chữ đen khi hover */
	transform: scale(1.05);
}

/* Nút "Hủy đơn hàng" */
.order-page .btn-danger {
	background-color: #000; /* Background đen */
	color: #fff; /* Chữ trắng */
	border: none;
	border-radius: 5px;
	padding: 8px 15px;
	transition: background-color 0.3s ease, transform 0.3s ease;
}

.order-page .btn-danger:hover {
	background-color: #ffc107; /* Màu vàng khi hover */
	color: #000; /* Chữ đen khi hover */
	transform: scale(1.05);
}

/* Nút Thêm vào giỏ hàng và các nút trong bảng */
.order-page .btn {
	font-size: 1rem;
	padding: 8px 15px;
	border-radius: 5px;
	cursor: pointer;
	background-color: #000; /* Background đen */
	color: #fff; /* Chữ trắng */
}

/* Cải thiện hiệu ứng collapse */
.order-page .collapse {
	transition: all 0.3s ease;
}

/* Nút collapse */
.order-page .collapse-button {
	background-color: #000; /* Background đen */
	color: white;
	border-radius: 5px;
	padding: 8px 15px;
	border: none;
	transition: background-color 0.3s ease;
}

.order-page .collapse-button:hover {
	background-color: #ffc107; /* Màu vàng khi hover */
	color: #000; /* Chữ đen khi hover */
}

.admin-home2 body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	color: #333;
	font-size: 16px; /* Tăng kích thước chữ */
}

.admin-home2 .navbar {
	background-color: transparent; /* Nền trong suốt */
	padding: 0.8rem 2rem;
	/* Điều chỉnh padding để thanh navbar có không gian thoáng */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
	/* Đổ bóng nhẹ cho navbar */
	transition: background-color 0.3s ease;
	/* Hiệu ứng chuyển nền khi hover */
}

.admin-home2 .navbar-brand {
	color: #ffc107; /* Chữ vàng cho brand */
	font-weight: bold;
	font-size: 1.8rem; /* Tăng cỡ chữ của brand */
	text-transform: uppercase; /* Chữ in hoa */
}

.admin-home2 .navbar-nav {
	display: flex;
	justify-content: center; /* Căn giữa các menu */
	margin-left: auto;
}

.admin-home2 .navbar-nav .nav-link {
	color: #fff; /* Màu chữ trắng cho các mục menu */
	font-weight: bold;
	font-size: 1.3rem; /* Tăng kích thước chữ của các mục menu */
	padding: 12px 25px; /* Tăng padding cho các nút */
	border-radius: 5px; /* Bo góc các nút menu */
	margin: 0 15px; /* Tạo khoảng cách giữa các mục menu */
	transition: background-color 0.3s ease, color 0.3s ease;
	/* Hiệu ứng chuyển màu mượt mà */
}

.admin-home2 .navbar-nav .nav-link:hover {
	background-color: #ffc107; /* Nền vàng khi hover */
	color: #000; /* Chữ đen khi hover */
}

.admin-home2 .navbar-nav .nav-link:focus {
	background-color: #e0a800; /* Nền vàng đậm khi focus */
	color: #000; /* Chữ đen khi focus */
}

.admin-home2 .navbar-nav .nav-link.active {
	background-color: #ffc107; /* Màu vàng khi mục được chọn */
	color: #000; /* Chữ đen khi chọn mục */
}

.admin-home2 .navbar-toggler-icon {
	background-color: #ffc107; /* Màu vàng cho icon menu */
}

.admin-home2 .container {
	margin-top: 40px;
}

.admin-home2 h1 {
	font-size: 2.9rem; /* Tăng kích thước chữ của h1 */
	font-weight: bold;
	text-align: center;
	color: #000;
}

.admin-home2 table {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.admin-home2 th, .admin-home2 td {
	text-align: center;
	padding: 12px;
	font-size: 1.2rem;
}

.admin-home2 th {
	background-color: #000; /* Nền đen cho các header */
	color: #fff; /* Chữ trắng cho header */
}

.admin-home2 td {
	font-size: 1.2rem;
	color: #333;
}

.admin-home2 tr:hover {
	background-color: #ffc107; /* Màu vàng khi hover vào hàng */
	color: #fff;
}

.admin-home2 .btn {
	font-size: 1.3rem; /* Tăng kích thước chữ của nút */
	padding: 8px 15px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.admin-home2 .btn-warning {
	background-color: #ffc107; /* Nền vàng cho nút sửa */
	color: #fff;
}

.admin-home2 .btn-warning:hover {
	background-color: #e0a800; /* Màu vàng đậm khi hover */
}

.admin-home2 .btn-danger {
	background-color: #dc3545; /* Nền đỏ cho nút xóa */
	color: #fff;
}

.admin-home2 .btn-danger:hover {
	background-color: #c82333; /* Màu đỏ đậm khi hover */
}

.admin-add body {
	background-color: #f4f4f4;
	color: #333;
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.admin-add .container {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	padding: 25px;
	max-width: 600px;
	margin: 50px auto;
}

.admin-add h1 {
	color: #000;
	font-weight: normal;
	margin-bottom: 30px;
	text-align: center;
	font-size: 28px;
	text-transform: uppercase;
}

.admin-add .form-group label {
	font-weight: normal;
	font-size: 16px;
}

.admin-add input, .admin-add textarea, .admin-add select {
	border-radius: 4px;
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	font-size: 16px;
	box-sizing: border-box;
	border: 1px solid #ddd;
}

.admin-add input, .admin-add textarea, .admin-add select {
	height: 45px;
}

.admin-add .btn-primary, .admin-add .btn-secondary {
	width: 48%;
	padding: 12px 18px;
	font-size: 16px;
	text-align: center;
	border-radius: 4px;
	margin-top: 10px;
	display: inline-block;
	cursor: pointer;
	border: none;
	transition: all 0.3s ease-in-out;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.admin-add .btn-primary {
	background-color: #F8D800;
	color: #333;
}

.admin-add .btn-primary:hover {
	background-color: #E0C000;
	transform: scale(1.05);
}

.admin-add .btn-secondary {
	background-color: #333;
	color: #fff;
}

.admin-add .btn-secondary:hover {
	background-color: #555;
	transform: scale(1.05);
}

.admin-add .btn-container {
	text-align: center;
}

.admin-add input:focus, .admin-add textarea:focus, .admin-add select:focus
	{
	border-color: #F8D800;
	box-shadow: 0 0 5px rgba(255, 215, 0, 0.7);
}

.admin-add .alert-danger {
	background-color: #ff4d4d;
	color: white;
	padding: 10px;
	border-radius: 4px;
	font-size: 14px;
	margin-bottom: 20px;
}

.admin-add img {
	border-radius: 8px;
	margin-top: 20px;
}

/* Thêm hiệu ứng hover cho các ô nhập liệu */
.admin-add input:hover, .admin-add textarea:hover, .admin-add select:hover
	{
	border-color: #F8D800;
}

.admin-add .form-group {
	position: relative;
}

.admin-add .form-group input[type="file"] {
	padding: 10px;
	border-radius: 4px;
	width: auto;
	margin-top: 10px;
}

/* Hiệu ứng chuyển động cho trang */
.admin-add .container {
	animation: fadeIn 1s ease-in-out;
}

.admin-userlist .container {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin-top: 40px;
	max-width: 900px;
	margin-left: auto;
	margin-right: auto;
	transition: all 0.3s ease;
}

.admin-userlist h1 {
	font-size: 24px; /* Giảm kích thước chữ */
	text-align: center; /* Căn giữa tiêu đề */
	color: #333; /* Màu chữ */
	margin-bottom: 20px; /* Khoảng cách dưới tiêu đề */
	font-weight: normal; /* Bỏ đậm chữ */
}

.admin-userlist .container:hover {
	transform: translateY(-10px);
	/* Di chuyển nhẹ lên khi hover vào container */
}

.admin-userlist .table {
	border-radius: 8px;
	border: 1px solid #ddd;
	overflow: hidden;
	transition: all 0.3s ease; /* Thêm hiệu ứng khi hover vào bảng */
}

.admin-userlist .table:hover {
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
	/* Thêm bóng đổ khi di chuột qua bảng */
	transform: translateY(-5px); /* Di chuyển nhẹ lên khi hover vào bảng */
}

.admin-userlist .table th, .admin-userlist .table td {
	text-align: center;
	padding: 15px;
	vertical-align: middle;
	transition: all 0.3s ease; /* Thêm hiệu ứng cho các ô khi hover */
}

.admin-userlist .table-striped tbody tr:hover {
	background-color: #f1e05a; /* Màu nền khi hover qua hàng */
	cursor: pointer;
	transition: background-color 0.3s ease;
	transform: scale(1.02); /* Tăng kích thước nhẹ khi hover */
}

.admin-userlist .table th {
	background-color: #333;
	color: #fff;
	font-size: 18px;
}

.admin-userlist .table td {
	font-size: 16px;
	transition: transform 0.2s ease;
}

.admin-userlist .table td:hover {
	transform: scale(1.05); /* Tăng kích thước các ô khi hover */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	/* Thêm bóng cho ô khi hover */
}

.admin-userlist .btn-secondary {
	display: inline-block;
	background-color: #333;
	color: #fff;
	padding: 12px 20px;
	font-size: 16px;
	border-radius: 4px;
	text-align: center;
	margin-top: 20px;
	width: 100%;
	cursor: pointer;
	text-decoration: none;
	transition: all 0.3s ease;
}

.admin-userlist .btn-secondary:hover {
	background-color: #555;
	transform: scale(1.05); /* Tăng kích thước nút khi hover */
}

@media ( max-width : 768px) {
	.admin-userlist .container {
		padding: 20px;
		max-width: 100%;
	}
	.admin-userlist .btn-secondary {
		width: auto;
	}
}

.admin-order .container {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin-top: 40px;
	max-width: 900px;
	margin-left: auto;
	margin-right: auto;
	transition: all 0.3s ease;
}

/* Căn giữa và giảm kích thước tiêu đề */
.admin-order h1 {
	font-size: 22px; /* Giảm kích thước chữ 2px */
	text-align: center; /* Căn giữa tiêu đề */
	color: #333; /* Màu chữ */
	margin-bottom: 20px; /* Khoảng cách dưới tiêu đề */
	font-weight: normal; /* Bỏ đậm chữ */
}

/* Hiệu ứng khi hover vào container */
.admin-order .container:hover {
	transform: translateY(-10px);
	/* Di chuyển nhẹ lên khi hover vào container */
}

/* Hiệu ứng cho bảng */
.admin-order .table {
	border-radius: 8px;
	border: 1px solid #ddd;
	overflow: hidden;
	transition: all 0.3s ease; /* Thêm hiệu ứng khi hover vào bảng */
}

/* Hiệu ứng khi hover vào bảng */
.admin-order .table:hover {
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
	/* Thêm bóng đổ khi di chuột qua bảng */
	transform: translateY(-5px); /* Di chuyển nhẹ lên khi hover vào bảng */
}

/* Hiệu ứng cho các ô trong bảng */
.admin-order .table th, .admin-order .table td {
	text-align: center;
	padding: 15px;
	vertical-align: middle;
	transition: all 0.3s ease; /* Thêm hiệu ứng cho các ô khi hover */
	font-size: 14px; /* Giảm kích thước chữ 2px */
}

/* Hiệu ứng khi hover qua các dòng trong bảng */
.admin-order .table-striped tbody tr:hover {
	background-color: #f1e05a; /* Màu nền khi hover qua hàng */
	cursor: pointer;
	transition: background-color 0.3s ease;
	transform: scale(1.02); /* Tăng kích thước nhẹ khi hover */
}

/* Màu nền cho các ô tiêu đề */
.admin-order .table th {
	background-color: #333;
	color: #fff;
	font-size: 16px; /* Giảm kích thước chữ 2px */
}

/* Font-size cho các ô dữ liệu */
.admin-order .table td {
	font-size: 14px; /* Giảm kích thước chữ 2px */
	transition: transform 0.2s ease;
}

/* Hiệu ứng khi hover vào ô dữ liệu */
.admin-order .table td:hover {
	transform: scale(1.05); /* Tăng kích thước các ô khi hover */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	/* Thêm bóng cho ô khi hover */
}

/* Nút thay đổi trạng thái và cập nhật */
.admin-order .btn-status, .admin-order .btn-update {
	display: inline-block; /* Đặt các nút cạnh nhau */
	padding: 8px 15px; /* Giảm padding để nút nhỏ lại */
	font-size: 12px; /* Giảm kích thước chữ 2px */
	border-radius: 4px;
	text-align: center;
	cursor: pointer;
	text-decoration: none;
	transition: all 0.3s ease;
	margin-right: 10px; /* Tạo khoảng cách giữa các nút */
}

/* Hiệu ứng khi hover vào nút thay đổi trạng thái */
.admin-order .btn-status:hover {
	background-color: #28a745; /* Màu khi hover */
	transform: scale(1.05); /* Tăng kích thước nhẹ khi hover */
}

/* Hiệu ứng khi hover vào nút cập nhật */
.admin-order .btn-update:hover {
	background-color: #ffc107; /* Màu khi hover */
	transform: scale(1.05); /* Tăng kích thước nhẹ khi hover */
}

/* Thêm màu nền cho các nút nếu cần */
.admin-order .btn-status {
	background-color: #28a745; /* Màu nền nút thay đổi trạng thái */
	color: white;
}

.admin-order .btn-update {
	background-color: #ffc107; /* Màu nền nút cập nhật */
	color: white;
}

/* Nút trở về trang chủ */
.admin-order .btn-secondary {
	display: inline-block;
	background-color: #333;
	color: #fff;
	padding: 12px 20px;
	font-size: 14px; /* Giảm kích thước chữ 2px */
	border-radius: 4px;
	text-align: center;
	margin-top: 20px;
	width: 100%;
	cursor: pointer;
	text-decoration: none;
	transition: all 0.3s ease;
}

/* Hiệu ứng khi hover vào nút */
.admin-order .btn-secondary:hover {
	background-color: #555;
	transform: scale(1.05); /* Tăng kích thước nút khi hover */
}

/* Thêm hiệu ứng cho nút xem chi tiết */
.admin-order .btn-info {
	transition: background-color 0.3s ease, transform 0.3s ease;
}

.admin-order .btn-info:hover {
	background-color: #17a2b8;
	transform: scale(1.05); /* Tăng kích thước nút xem chi tiết */
}

/* Điều chỉnh responsive cho các thiết bị di động */
@media ( max-width : 768px) {
	.admin-order .container {
		padding: 20px;
		max-width: 100%;
	}
	.admin-order .btn-secondary {
		width: auto;
	}

	/* Điều chỉnh kích thước tiêu đề trên thiết bị di động */
	.admin-order h1 {
		font-size: 18px; /* Giảm kích thước chữ tiêu đề trên mobile */
	}
	.admin-order .btn-status, .admin-order .btn-update {
		font-size: 10px; /* Giảm thêm kích thước chữ trên thiết bị di động */
		padding: 6px 12px; /* Giảm padding trên thiết bị di động */
	}
}
/* Toàn bộ trang với nền tối */
.admin-reve body {
	background-color: #1a1a1a; /* Nền đen */
	font-family: 'Arial', sans-serif;
	color: white; /* Chữ màu trắng */
}

/* Chỉnh sửa container */
.admin-reve .container {
	background-color: #fff; /* Nền trắng cho container */
	color: #333; /* Màu chữ đen */
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin-top: 40px;
}

/* Tiêu đề trang */
.admin-reve h1 {
	font-size: 28px;
	text-align: center;
	color: #ffcc00; /* Màu vàng */
	margin-bottom: 20px;
}

/* Nút trở về trang chủ */
/* Nút trở về trang chủ */
.admin-reve .btn-secondary {
	background-color: #1a1a1a; /* Nền đen */
	color: #fff; /* Chữ trắng */
	padding: 8px 15px; /* Kích thước nhỏ hơn */
	font-size: 14px; /* Font chữ nhỏ hơn */
	border-radius: 4px;
	text-align: center;
	transition: all 0.3s ease;
	bottom: 20px; /* Cách dưới 20px */
	left: 20px; /* Cách trái 20px (có thể thay đổi để căn phải nếu muốn) */
	z-index: 100; /* Đảm bảo nút hiển thị trên các phần tử khác */
}

/* Hiệu ứng khi hover vào nút */
.admin-reve .btn-secondary:hover {
	background-color: #333333; /* Màu đen đậm khi hover */
	transform: scale(1.05); /* Tăng kích thước nút khi hover */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Thêm bóng đổ khi hover */
}

/* Bảng dữ liệu */
.admin-reve .table {
	border-radius: 8px;
	border: 1px solid #ddd;
	margin-top: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
}

.admin-reve .table th {
	background-color: #ffcc00; /* Màu vàng */
	color: #1a1a1a; /* Màu chữ đen */
	text-align: center;
	font-size: 16px;
}

.admin-reve .table td {
	text-align: center;
	padding: 10px;
	font-size: 14px;
}

/* Chỉnh màu nền khi hover vào các dòng bảng */
.admin-reve .table tbody tr:hover {
	background-color: #333333; /* Nền xám đen khi hover */
	color: white; /* Chữ trắng khi hover */
	cursor: pointer;
}

/* Biểu đồ */
.admin-reve #revenueChart {
	margin-top: 40px;
}

/* Các nút trong form */
.admin-reve .form-control {
	width: 200px;
	display: inline-block;
	margin-right: 10px;
}

</style>
</head>
<body class="body-container">
	<!-- Header -->
	<%@ include file="/common/admin/header.jsp"%>
	<!-- End Header -->

	<div class="container">
		<dec:body />
	</div>
	<!-- Footer -->
	<div class="footer-container">
		<%@ include file="/common/admin/footer.jsp"%>
	</div>

	<!-- End Footer -->

	<!-- Plugins JS File -->
	<script src="<c:url value='/template/web/assets/js/jquery.min.js' />"></script>
	<script
		src="<c:url value='/template/web/assets/js/bootstrap.bundle.min.js' />"></script>
	<script
		src="<c:url value='/template/web/assets/js/jquery.hoverIntent.min.js' />"></script>
	<script
		src="<c:url value='/template/web/assets/js/jquery.waypoints.min.js' />"></script>
	<script
		src="<c:url value='/template/web/assets/js/superfish.min.js' />"></script>
	<script
		src="<c:url value='/template/web/assets/js/owl.carousel.min.js' />"></script>
	<script
		src="<c:url value='/template/web/assets/js/bootstrap-input-spinner.js' />"></script>
	<script
		src="<c:url value='/template/web/assets/js/jquery.plugin.min.js' />"></script>
	<script
		src="<c:url value='/template/web/assets/js/jquery.magnific-popup.min.js' />"></script>
	<script
		src="<c:url value='/template/web/assets/js/jquery.countdown.min.js' />"></script>
	<!-- Main JS File -->
	<script src="<c:url value='/template/web/assets/js/main.js' />"></script>
	<script src="<c:url value='/template/web/assets/js/demos/demo-3.js' />"></script>
</body>
</html>
