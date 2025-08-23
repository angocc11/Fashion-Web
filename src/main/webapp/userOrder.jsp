<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.doan.Shop.Model.Orders, com.doan.Shop.Model.Order_items"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
<style>
/* Điều chỉnh kích thước các cột */
.table th:nth-child(1), /* ID Đơn hàng */
.table td:nth-child(1) {
    width: %; /* Thay đổi giá trị này theo ý muốn */
}

.table th:nth-child(2), /* Tổng số lượng */
.table td:nth-child(2) {
    width: 5%; /* Thay đổi giá trị này theo ý muốn */
}
</style>

document.querySelectorAll('[data-toggle="collapse"]').forEach(button => {
    button.addEventListener('click', () => {
        const targetId = button.getAttribute('data-target');
        const targetElement = document.querySelector(targetId);

        if (targetElement.classList.contains('show')) {
            targetElement.classList.remove('show');
        } else {
            targetElement.classList.add('show');
        }
    });
});
</script>
<head>
<meta charset="UTF-8">
<title>Lịch sử Đơn hàng</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
/* (Như phần CSS trên) */
</style>
</head>
<body>
	<div class="order-page">
		<div class="container">
			<h1 class="my-4">Lịch sử Đơn hàng của bạn</h1>
			<table class="table table-striped">
				<thead>
					<tr>
						<th style="width: 10%;">ID Đơn hàng</th>
						<th style="width: 15%;">Tổng số lượng</th>
						<th>Thành tiền</th>
						<th>Trạng thái</th>
						<th>Ngày mua</th>
						<th>Chi tiết đơn hàng</th>
						<th>Hành động</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orders}">
						<tr>
							<td>${order.ID}</td>
							<td>${order.tongSoLuong}</td>
							<td>${order.thanhTien}</td>
							<td>${order.trangThai}</td>
							<td>${order.ngayMua}</td>
							<td>
								<button class="btn btn-info" type="button"
									data-toggle="collapse" data-target="#orderItems_${order.ID}"
									aria-expanded="false" aria-controls="orderItems_${order.ID}">
									Xem chi tiết</button>
							</td>
							<td>
        <c:if test="${order.trangThai != 'Cancelled'}">
            <form action="OrderServlet" method="post" style="display: inline;">
                <input type="hidden" name="orderId" value="${order.ID}" />
                <input type="hidden" name="action" value="cancelOrder" />
                <button type="submit" class="btn btn-danger">Hủy đơn hàng</button>
            </form>
        </c:if>
    </td>
</tr>

						<tr class="collapse" id="orderItems_${order.ID}">
							<td colspan="7">
								<table class="table">
									<thead>
										<tr>
											<th>ID Sản phẩm</th>
											<th>Tên Sản phẩm</th>
											<th>Số lượng</th>
											<th>Đơn giá</th>
										</tr>
									</thead>
									<tbody>
										<!-- Truy cập trực tiếp từ orderItemsMap -->
										<c:forEach var="item" items="${orderItemsMap[order.ID]}">
											<tr>
												<td>${item.product_id}</td>
												<!-- ID sản phẩm -->
												<td>${item.tenSanPham}</td>
												<!-- Tên sản phẩm -->
												<td>${item.soLuong}</td>
												<!-- Số lượng -->
												<td>${item.donGia}</td>
												<!-- Đơn giá -->
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>
