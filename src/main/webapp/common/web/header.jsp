<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="user-header">
	<div class="header">
		<div class="container">
			<!-- Logo bên trái -->
			<div class="logo">
				<img
					src="<c:url value='/template/web/assets/images/demos/demo-3/logo-footer.png' />"
					class="footer-logo" alt="Footer Logo" width="150" height="5">
			</div>

			<!-- Menu nằm ngang -->
			<ul class="menu-list">
				<li><a href="index.jsp">TRANG CHỦ</a></li>
				<li class="dropdown"><a href="#">SẢN PHẨM</a> <!-- Dropdown Menu -->
					<div class="dropdown-content">
						<select id="categorySelect" name="loaiSanPham"
							class="form-control ml-2" onchange="searchProducts()">
							<option value="">Tất cả loại</option>
							<option value="Quần áo nam">Quần áo nam</option>
							<option value="Quần áo nữ">Quần áo nữ</option>
							<option value="Quần áo trẻ em">Quần áo trẻ em</option>
							<option value="Phụ Kiện">Phụ Kiện</option>
						</select>
					</div></li>
				<li><a href="OrderServlet">ĐƠN HÀNG</a></li>
				<li><a href="#">GIỚI THIỆU</a></li>
				<li><a href="#">LIÊN HỆ</a></li>
			</ul>

			<!-- Giỏ hàng và trang cá nhân bên phải -->
			<div class="header-right">
				<div class="icon" title="Giỏ hàng">
					<a href="CartControllerServlet?action=viewCart"> <i
						class="fa fa-shopping-cart"></i> <!-- Icon giỏ hàng -->
					</a>
				</div>
				<div class="icon" title="Trang cá nhân">
					<a href="UserControllerServlet?action=viewUserProfile"> <i
						class="fa fa-user"></i>
					</a>

					<!-- Icon trang cá nhân -->
				</div>
				<div class="icon" title="Đăng nhập">

					<a href="login.jsp"> <i class="fa fa-sign-in-alt"></i>
					</a>
				</div>
				<div class="icon" title="Đăng xuất">

					<a href="LogoutServlet"><i class="fa fa-sign-out-alt"></i> </a>
				</div>
			</div>

		</div>

		<!-- Thanh tìm kiếm nằm dưới menu và căn giữa -->
		<!-- Thanh tìm kiếm nằm dưới menu và căn giữa -->
<div class="search-container">
    <form class="search-box" method="get" action="ProductListServlet">
        <input type="text" class="search-bar" name="keyword" id="searchKeyword" placeholder="Tìm kiếm sản phẩm..." 
               value="${keyword != null ? keyword : ''}">
        
       
    </form>
</div>

	</div>
</div>