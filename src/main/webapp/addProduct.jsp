<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="com.doan.Shop.DAO.ProductDAO"%>
<%@ page import="com.doan.Shop.Model.Products"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
// Lấy product ID từ URL nếu có
String idParam = request.getParameter("id");
Products product = null;
if (idParam != null && !idParam.isEmpty()) {
	try {
		int productId = Integer.parseInt(idParam);
		ProductDAO productDAO = new ProductDAO();
		product = productDAO.getProductById(productId);
	} catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("error.jsp?message=ProductNotFound");
		return;
	}
}
request.setAttribute("product", product);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title><c:choose>
		<c:when test="${product != null}">Sửa Sản phẩm</c:when>
		<c:otherwise>Thêm Sản phẩm Mới</c:otherwise>
	</c:choose></title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-color: #f4f4f4;
	color: #333;
}

.container {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

h1 {
	color: #F8D800; /* Vàng */
	font-weight: bold;
	margin-bottom: 20px;
}

.form-group label {
	font-weight: bold;
}

.btn-primary {
	background-color: #F8D800;
	border-color: #F8D800;
	transition: background-color 0.3s ease;
}

.btn-primary:hover {
	background-color: #E0C000;
	border-color: #E0C000;
}

.btn-secondary {
	background-color: #333;
	color: #fff;
	transition: background-color 0.3s ease;
}

.btn-secondary:hover {
	background-color: #555;
}

input, textarea, select {
	border-radius: 4px;
	box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12), 0 0 8px
		rgba(255, 215, 0, 0.2);
}

input:focus, textarea:focus, select:focus {
	border-color: #F8D800;
	box-shadow: 0 0 5px rgba(255, 215, 0, 0.7);
}

.alert-danger {
	background-color: #ff4d4d;
	color: white;
	padding: 10px;
	border-radius: 4px;
}

img {
	border-radius: 8px;
}
</style>
</head>
<body>
	<div class="admin-add">
		<div class="container">
			<h1 class="my-4">
				<c:choose>
					<c:when test="${product != null}">Sửa Sản phẩm</c:when>
					<c:otherwise>Thêm Sản phẩm Mới</c:otherwise>
				</c:choose>
			</h1>

			<!-- Hiển thị thông báo lỗi nếu có -->
			<c:if test="${not empty error}">
				<div class="alert alert-danger">${error}</div>
			</c:if>

			<form
				action="${product != null ? 'UpdateProductServlet' : 'AddProductServlet'}"
				method="POST" enctype="multipart/form-data">
				<!-- Truyền ID sản phẩm khi chỉnh sửa -->
				<c:if test="${product != null}">
					<input type="hidden" name="id" value="${product.id}">
				</c:if>

				<div class="form-group">
					<label for="tenSanPham">Tên sản phẩm</label> <input type="text"
						class="form-control" id="tenSanPham" name="tenSanPham"
						value="${product != null ? product.tenSanPham : ''}" required>
				</div>

				<div class="form-group">
					<label for="gia">Giá</label> <input type="number"
						class="form-control" id="gia" name="gia"
						value="${product != null ? product.gia : '0'}" required min="0"
						step="1000">
				</div>

				<div class="form-group">
					<label for="moTa">Mô tả</label>
					<textarea class="form-control" id="moTa" name="moTa" required>${product != null ? product.moTa : ''}</textarea>
				</div>

				<div class="form-group">
					<label for="soLuongCon">Số lượng còn</label> <input type="number"
						class="form-control" id="soLuongCon" name="soLuongCon"
						value="${product != null ? product.soLuongCon : '0'}" required
						min="0">
				</div>

				<div class="form-group">
					<label for="loaiSanPham">Loại sản phẩm</label> <select
						class="form-control" id="loaiSanPham" name="loaiSanPham" required>
						<option value="Quần áo nam"
							${product != null && product.loaiSanPham == 'Quần áo nam' ? 'selected' : ''}>Quần
							áo nam</option>
						<option value="Quần áo nữ"
							${product != null && product.loaiSanPham == 'Quần áo nữ' ? 'selected' : ''}>Quần
							áo nữ</option>
						<option value="Quần áo trẻ em"
							${product != null && product.loaiSanPham == 'Quần áo trẻ em' ? 'selected' : ''}>Quần
							áo trẻ em</option>
						<option value="Phụ kiện"
							${product != null && product.loaiSanPham == 'Phụ kiện' ? 'selected' : ''}>Phụ
							kiện</option>
					</select>
				</div>

				<!-- Hiển thị hình ảnh hiện tại nếu có -->
				<c:if test="${product != null && product.hinhAnh != null}">
					<div class="form-group">
						<label>Hình ảnh hiện tại:</label><br> <img
							src="${pageContext.request.contextPath}/${product.hinhAnh}"
							alt="${product.tenSanPham}"
							style="width: 150px; height: 150px; object-fit: cover;">
					</div>
				</c:if>

				<!-- Upload hình ảnh mới -->
				<div class="form-group">
					<label for="hinhAnh">Hình ảnh</label> <input type="file"
						class="form-control" id="hinhAnh" name="hinhAnh">
					<c:if test="${product != null && product.hinhAnh != null}">
						<input type="hidden" name="currentImagePath"
							value="${product.hinhAnh}">
					</c:if>
				</div>

				<div class="btn-container">
					<button type="submit" class="btn btn-primary">Lưu sản phẩm</button>
					<a href="adminDashboard.jsp" class="btn btn-secondary">Trở về
						trang chủ</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
