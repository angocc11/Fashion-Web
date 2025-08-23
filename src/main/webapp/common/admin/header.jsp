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
				<li><a href="adminDashboard.jsp">TRANG CHỦ</a></li>
				<li><a href="addProduct.jsp">SẢN PHẨM</a></li>
				<li><a href="/views/admin/userList.jsp">USER</a></li>
				<li><a href="OrderServlet">GIAO DỊCH</a></li>
				<li><a href="RevenueServlet">DOANH THU</a></li>
			</ul>

			<!-- Giỏ hàng và trang cá nhân bên phải -->
			<div class="header-right">
				
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
		<div class="search-container">
			<div class="search-box">
				<input type="text" class="search-bar"
					placeholder="Tìm kiếm sản phẩm...">
				<!-- Icon tìm kiếm trong input <i class="fa fa-search search-icon"></i>-->
			</div>
		</div>
	</div>
</div>