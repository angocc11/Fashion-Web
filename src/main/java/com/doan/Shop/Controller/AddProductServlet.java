package com.doan.Shop.Controller;

import com.doan.Shop.DAO.ProductDAO;
import com.doan.Shop.Model.Products;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
@MultipartConfig(
	    location = "D:\\ltweb\\eclipse\\UploadsTmp", // Đường dẫn thư mục mới
	    maxFileSize = 1024 * 1024 * 10, // Giới hạn 10MB
	    maxRequestSize = 1024 * 1024 * 50, // Giới hạn 50MB
	    fileSizeThreshold = 1024 * 1024 // Ngưỡng bộ nhớ 1MB
	)
//@MultipartConfig(location = "C:/DoAnCNTT20/uploadtt") // hoặc chọn thư mục khác phù hợp
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        try {
            // Lấy các thông tin từ request
            String tenSanPham = request.getParameter("tenSanPham");
            String giaParam = request.getParameter("gia");
            String moTa = request.getParameter("moTa");
            String soLuongConParam = request.getParameter("soLuongCon");
            String loaiSanPham = request.getParameter("loaiSanPham");
            // Kiểm tra và chuyển đổi giá trị của `gia` và `soLuongCon`
            int gia = (giaParam != null && !giaParam.isEmpty()) ? Integer.parseInt(giaParam) : 0;
            int soLuongCon = (soLuongConParam != null && !soLuongConParam.isEmpty()) ? Integer.parseInt(soLuongConParam) : 0;

            // Xử lý upload hình ảnh
            String hinhAnhPath = "";
            Part filePart = request.getPart("hinhAnh");

            // Nếu có file ảnh được tải lên, lưu ảnh vào thư mục
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

                // Đảm bảo thư mục upload tồn tại
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

                // Lưu file ảnh vào thư mục uploads
                filePart.write(uploadPath + File.separator + fileName);
                hinhAnhPath = "uploads/" + fileName; // Đường dẫn để lưu vào CSDL
            }

            // Tạo sản phẩm mới
            ProductDAO productDAO = new ProductDAO();
            Products product = new Products(0, tenSanPham, moTa, gia, soLuongCon,loaiSanPham, hinhAnhPath);
            int rowsAffected = productDAO.addProduct(product);

            // Kiểm tra xem sản phẩm có được thêm thành công không
            if (rowsAffected > 0) {
                response.sendRedirect("adminDashboard.jsp"); // Trở về trang admin sau khi thêm thành công
            } else {
                response.sendRedirect("error.jsp?message=AddFailed"); // Thông báo lỗi nếu thêm không thành công
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Dữ liệu số không hợp lệ.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
