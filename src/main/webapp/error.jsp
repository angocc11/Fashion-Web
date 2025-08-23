<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lỗi</title>
</head>
<body>
    <h1>Rất tiếc, đã có lỗi xảy ra trong quá trình xử lý yêu cầu của bạn.</h1>
    <p>Lỗi: <c:out value="${param.message}" /></p> <!-- Hiển thị thông báo lỗi từ servlet -->
    
    <c:choose>
        <c:when test="${param.message == 'InvalidProductId'}">
            <p>Không tìm thấy ID sản phẩm hợp lệ. Vui lòng kiểm tra và thử lại.</p>
        </c:when>
        <c:when test="${param.message == 'SQLException'}">
            <p>Đã xảy ra lỗi trong quá trình cập nhật dữ liệu. Vui lòng kiểm tra kết nối cơ sở dữ liệu.</p>
        </c:when>
        <c:when test="${param.message == 'ClassNotFoundException'}">
            <p>Không tìm thấy lớp cần thiết. Vui lòng kiểm tra cấu hình JDBC.</p>
        </c:when>
        <c:otherwise>
            <p>Một lỗi không xác định đã xảy ra. Vui lòng thử lại sau.</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
