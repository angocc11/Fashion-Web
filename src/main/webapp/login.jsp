<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-0">
		<div class="container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">Home</a></li>
				<li class="breadcrumb-item"><a href="#">Pages</a></li>
				<li class="breadcrumb-item active" aria-current="page">Login</li>
			</ol>
		</div>
	</nav>

	<div
		class="login-page bg-image pt-8 pb-8 pt-md-12 pb-md-12 pt-lg-17 pb-lg-17"
		style="background-image: url('<c:url value='/template/web/assets/images/backgrounds/login-bg.jpg' />')">
		<div class="container">
			<div class="form-box">
				<div class="form-tab">
					<ul class="nav nav-pills nav-fill" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="signin-tab-2" data-toggle="tab" href="#signin-2" role="tab"
							aria-controls="signin-2" aria-selected="true">Sign In</a></li>
						<li class="nav-item"><a class="nav-link" id="register-tab-2"
							data-toggle="tab" href="#register-2" role="tab"
							aria-controls="register-2" aria-selected="false">Register</a></li>
					</ul>
					<div class="tab-content">
						<!-- Form đăng nhập -->
						<div class="tab-pane fade show active" id="signin-2"
							role="tabpanel" aria-labelledby="signin-tab-2">
							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="username">Username *</label> <input type="text"
										class="form-control" id="username" name="username" required>
								</div>
								<div class="form-group">
									<label for="password">Password *</label> <input type="password"
										class="form-control" id="password" name="password" required>
								</div>
								<div class="form-footer">
									<button type="submit" class="btn btn-outline-primary-2">
										<span>LOG IN</span> <i class="icon-long-arrow-right"></i>
									</button>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="signin-remember-2"> <label
											class="custom-control-label" for="signin-remember-2">Remember
											Me</label>
									</div>
									<a href="${pageContext.request.contextPath}/forgotPassword.jsp"
										class="forgot-link">Forgot Your Password?</a>
								</div>
								<!-- Hiển thị lỗi nếu thông tin đăng nhập sai -->
								<c:if test="${param.error == 'invalid'}">
									<div class="alert alert-danger mt-3">Invalid username or
										password. Please try again.</div>
								</c:if>
							</form>
							<div class="form-choice">
								<p class="text-center">or sign in with</p>
								<div class="row">
									<div class="col-sm-6">
										<a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/DoAnCNTT/GoogleLogin&response_type=code&client_id=363310503754-g37i26m7imve7dj9fckf15o00ffp919m.apps.googleusercontent.com&approval_prompt=force" class="btn btn-login btn-g"> <i
											class="icon-google"></i> Login With Google
										</a>

									</div>
									<div class="col-sm-6">
										<a href="#" class="btn btn-login btn-f"> <i
											class="icon-facebook-f"></i> Login With Facebook
										</a>
									</div>
								</div>
							</div>
						</div>
						<!-- Form đăng ký -->
						<div class="tab-pane fade" id="register-2" role="tabpanel"
							aria-labelledby="register-tab-2">
							<form action="UserControllerServlet?action=registerUser"
								method="post">
								<div class="form-group">
									<label for="register-username-2">Tên đăng nhập *</label> <input
										type="text" class="form-control" id="register-username-2"
										name="username" required>
								</div>
								<div class="form-group">
									<label for="register-password-2">Mật khẩu *</label> <input
										type="password" class="form-control" id="register-password-2"
										name="password" required>
								</div>
								<div class="form-group">
									<label for="register-name-2">Tên người mua *</label> <input
										type="text" class="form-control" id="register-name-2"
										name="buyerName" required>
								</div>
								<div class="form-group">
									<label for="register-email-2">Email *</label> <input
										type="email" class="form-control" id="register-email-2"
										name="email" required>
								</div>
								<div class="form-group">
									<label for="register-phone-2">Số điện thoại *</label> <input
										type="tel" class="form-control" id="register-phone-2"
										name="phone" required>
								</div>
								<div class="form-group">
									<label for="register-address-2">Địa chỉ *</label> <input
										type="text" class="form-control" id="register-address-2"
										name="address" required>
								</div>
								<div class="form-footer">
									<button type="submit" class="btn btn-outline-primary-2">
										<span>ĐĂNG KÝ</span> <i class="icon-long-arrow-right"></i>
									</button>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="register-policy-2" required> <label
											class="custom-control-label" for="register-policy-2">
											Tôi đồng ý với <a href="#">chính sách bảo mật</a> *
										</label>
									</div>
								</div>
							</form>
							<div class="form-choice">
								<p class="text-center">hoặc đăng nhập bằng</p>
								<div class="row">
									<div class="col-sm-6">
											class="icon-google"></i> Đăng nhập với Google
										</a>
									</div>
									<div class="col-sm-6">
										<a href="#" class="btn btn-login btn-f"> <i
											class="icon-facebook-f"></i> Đăng nhập với Facebook
										</a>
									</div>
								</div>
							</div>
						</div>

					</div>
					<!-- End .tab-content -->
				</div>
				<!-- End .form-tab -->
			</div>
			<!-- End .form-box -->
		</div>
		<!-- End .container -->
	</div>
	<!-- End .login-page section-bg -->
</body>
</html>