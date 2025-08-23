<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.doan.Shop.DAO.ProductDAO, com.doan.Shop.Model.Products"%>
<%
    // Khởi tạo tiêu đề và URL hành động mặc định cho việc thêm sản phẩm
    String formTitle = "Thêm sản phẩm mới";
    String actionURL = "AddProductServlet";
    Products product = new Products(); // Sản phẩm mặc định khi thêm mới
    
    // Kiểm tra xem có tham số 'id' không (để biết là đang sửa hay xóa)
    String id = request.getParameter("id");
    if (id != null && !id.isEmpty()) {
        ProductDAO productDAO = new ProductDAO();
        int productId = Integer.parseInt(id);
        product = productDAO.getProductById(productId); // Lấy sản phẩm từ DB
        
        // Điều chỉnh tiêu đề và URL hành động cho việc sửa sản phẩm
        formTitle = "Sửa sản phẩm";
        actionURL = "EditProductServlet";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= formTitle %></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1><%= formTitle %></h1>
        <form action="<%= actionURL %>" method="post">
            <!-- Trường ẩn ID cho sản phẩm (dùng khi sửa hoặc xóa) -->
            <input type="hidden" name="id" value="<%= product.getId() %>">
            <div class="form-group">
                <label for="tenSanPham">Tên sản phẩm:</label>
                <input type="text" class="form-control" id="tenSanPham" name="tenSanPham" value="<%= product.getTenSanPham() %>" required>
            </div>
            <div class="form-group">
                <label for="gia">Giá:</label>
                <input type="number" class="form-control" id="gia" name="gia" value="<%= product.getGia() %>" required>
            </div>
            <div class="form-group">
                <label for="moTa">Mô tả:</label>
                <textarea class="form-control" id="moTa" name="moTa" required><%= product.getMoTa() %></textarea>
            </div>
            <div class="form-group">
                <label for="soLuongCon">Số lượng còn:</label>
                <input type="number" class="form-control" id="soLuongCon" name="soLuongCon" value="<%= product.getSoLuongCon() %>" required>
            </div>
            <!-- Nút để thêm hoặc cập nhật sản phẩm -->
            <button type="submit" class="btn btn-success"><%= (id != null) ? "Cập nhật" : "Thêm mới" %></button>
            <!-- Nút để xóa sản phẩm nếu đang trong chế độ sửa -->
            <% if (id != null) { %>
                <a href="DeleteProductServlet?id=<%= product.getId() %>" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');">Xóa</a>
            <% } %>
            <a href="adminDashboard.jsp" class="btn btn-primary">Quay lại</a>
        </form>
    </div>
</body>
</html>
