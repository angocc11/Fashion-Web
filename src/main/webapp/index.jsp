<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.doan.Shop.DAO.ProductDAO, com.doan.Shop.Model.Products"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
ProductDAO productDAO = new ProductDAO();
String keyword = request.getParameter("keyword");
List<Products> products;

if (keyword != null && !keyword.isEmpty()) {
	products = productDAO.searchProducts(keyword);
} else {
	products = productDAO.getAllProducts();
}

request.setAttribute("products", products);
request.setAttribute("keyword", keyword);

productDAO.closeConnection();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Danh sách sản phẩm</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.search-form {
	margin-left: 200px;
}
</style>
<script>
	function searchProducts() {
		const keyword = document.getElementById("searchKeyword").value;
		const category = document.getElementById("categorySelect").value;
		const xhr = new XMLHttpRequest();
		xhr.open("GET", "ProductControllerServlet?keyword="
				+ encodeURIComponent(keyword) + "&loaiSanPham="
				+ encodeURIComponent(category), true);
		xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
		xhr.onload = function() {
			if (xhr.status === 200) {
				document.getElementById("productList").innerHTML = xhr.responseText;
			}
		};
		xhr.send();
	}
</script>
</head>
<body>
	<h2 class="tieude2">BỘ SƯU TẬP NỔI BẬT</h2>
	<!-- Carousel -->
	<div id="carouselExample" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="${pageContext.request.contextPath}/template/web/assets/images/hinho2.jpg"
					class="d-block w-100" alt="Image 1">
			</div>
			<div class="carousel-item">
				<img
					src="${pageContext.request.contextPath}/template/web/assets/images/hinho1.jpg"
					class="d-block w-100" alt="Image 2">
			</div>
			<div class="carousel-item">
				<img
					src="${pageContext.request.contextPath}/template/web/assets/images/hinh07.jpg"
					class="d-block w-100" alt="Image 3">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExample" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExample"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<h2 class="tieude2">SẢN PHẨM BÁN CHẠY</h2>
	<div id="carouselExample" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="${pageContext.request.contextPath}/template/web/assets/images/hinh04.jpg"
					class="d-block w-100" alt="Image 1">
			</div>
			<div class="carousel-item">
				<img
					src="${pageContext.request.contextPath}/template/web/assets/images/hinh05.jpg"
					class="d-block w-100" alt="Image 2">
			</div>
			<div class="carousel-item">
				<img
					src="${pageContext.request.contextPath}/template/web/assets/images/hinh06.jpg"
					class="d-block w-100" alt="Image 3">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExample" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExample"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<!-- Hiển thị thông tin người dùng nếu đã đăng nhập -->
	<c:if test="${not empty sessionScope.user_id}">
		<p>Chào mừng, ${sessionScope.user_name}!</p>
		<!-- Hiển thị các sản phẩm hoặc các nội dung khác dành cho người dùng đã đăng nhập -->
	</c:if>

	<c:if test="${empty sessionScope.user_id}">

	</c:if>

	<!-- Nội dung khác của trang index.jsp -->
	<div class="container" id="productList">
		<jsp:include page="productList.jsp">
			<jsp:param name="products" value="${products}" />
			<jsp:param name="keyword" value="${keyword}" />
		</jsp:include>
	</div>

	<script
		src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
	<df-messenger intent="WELCOME" chat-title="Chatbot"
		agent-id="b596dbb0-fd80-45ff-a020-5d48d3d39eca" language-code="vi"></df-messenger>
</body>
</html>
