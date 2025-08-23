<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Báo cáo Doanh thu</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
body {
	background-color: #f4f7fc; /* Màu nền nhẹ nhàng */
	font-family: 'Arial', sans-serif;
	color: #333; /* Màu chữ chính */
}

/* Chỉnh sửa container */
.container {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin-top: 40px;
}

/* Tiêu đề trang */
h1 {
	font-size: 28px;
	text-align: center;
	color: #1c1c1c;
	margin-bottom: 20px;
}

/* Nút trở về trang chủ */
.btn-secondary {
	background-color: #007bff; /* Màu xanh dương */
	color: white;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 4px;
	text-align: center;
	margin-bottom: 20px;
	width: 100%;
	transition: all 0.3s ease;
}

.btn-secondary:hover {
	background-color: #0056b3;
	transform: scale(1.05);
}

/* Bảng dữ liệu */
.table {
	border-radius: 8px;
	border: 1px solid #ddd;
	margin-top: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
}

.table th {
	background-color: #007bff;
	color: white;
	text-align: center;
	font-size: 16px;
}

.table td {
	text-align: center;
	padding: 10px;
	font-size: 14px;
}

/* Chỉnh màu nền khi hover vào các dòng bảng */
.table tbody tr:hover {
	background-color: #f1f1f1;
	cursor: pointer;
}

/* Biểu đồ */
#revenueChart {
	margin-top: 40px;
}

/* Các nút trong form */
.form-control {
	width: 200px;
	display: inline-block;
	margin-right: 10px;
}
</style>
</head>
<body>
	<div class="admin-reve">
		<div class="container my-4">
			<h1>Báo cáo Doanh thu</h1>
			<!-- Form chọn loại báo cáo -->
			<form method="get" action="RevenueServlet" id="reportForm">
				<label for="type">Chọn loại báo cáo:</label> <select id="type"
					name="type" class="form-control"
					style="width: 200px; display: inline-block;"
					onchange="document.getElementById('reportForm').submit()">
					<option value="day" ${type == 'day' ? 'selected' : ''}>Theo
						ngày</option>
					<option value="month" ${type == 'month' ? 'selected' : ''}>Theo
						tháng</option>
				</select>
			</form>

			<!-- Nút trở về trang chủ -->
			<a href="adminDashboard.jsp" class="btn btn-secondary mb-3">Trở
				về trang chủ</a>

			<!-- Bảng hiển thị doanh thu -->
			<table class="table table-bordered mt-4">
				<thead>
					<tr>
						<c:choose>
							<c:when test="${type == 'month'}">
								<th>Tháng</th>
								<th>Năm</th>
							</c:when>
							<c:otherwise>
								<th>Ngày</th>
							</c:otherwise>
						</c:choose>
						<th>Doanh thu (VND)</th>
						<th>Tổng số lượng đơn hàng</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${revenueData}">
						<tr>
							<c:choose>
								<c:when test="${type == 'month'}">
									<td>${row.month}</td>
									<td>${row.year}</td>
								</c:when>
								<c:otherwise>
									<td>${row.date}</td>
								</c:otherwise>
							</c:choose>
							<td>${row.revenue}</td>
							<td>${row.order_count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- Canvas để vẽ biểu đồ -->
			<div class="my-4">
				<canvas id="revenueChart"></canvas>
			</div>
		</div>
	</div>
	<!-- Script để tạo biểu đồ -->
	<script>
    const labels = [
        <c:forEach var="row" items="${revenueData}">
            "<c:choose><c:when test='${type == "month"}'>${row.month}/${row.year}</c:when><c:otherwise>${row.date}</c:otherwise></c:choose>",
        </c:forEach>
    ];
    const dataRevenue = [
        <c:forEach var="row" items="${revenueData}">
            ${row.revenue},
        </c:forEach>
    ];

    const ctx = document.getElementById('revenueChart').getContext('2d');
    const revenueChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Doanh thu (VND)',
                data: dataRevenue,
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                fill: true,
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { display: true }
            },
            scales: {
                x: {
                    title: { display: true, text: '${type == "month" ? "Tháng/Năm" : "Ngày"}' }
                },
                y: {
                    title: { display: true, text: 'Doanh thu (VND)' },
                    beginAtZero: true
                }
            }
        }
    });
</script>
</body>
</html>
