package com.doan.Shop.Controller;

import com.doan.Shop.DAO.ProductDAO;
import com.doan.Shop.Model.Products;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/UpdateProductServlet")
@MultipartConfig
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("error.jsp?message=InvalidProductId");
            return;
        }

        int productId;
        try {
            productId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp?message=InvalidProductId");
            return;
        }

        String tenSanPham = request.getParameter("tenSanPham");
        int gia = Integer.parseInt(request.getParameter("gia"));
        String moTa = request.getParameter("moTa");
        int soLuongCon = Integer.parseInt(request.getParameter("soLuongCon"));
        
        // Lấy đường dẫn hình ảnh hiện tại (nếu có)
        String hinhAnhPath = request.getParameter("currentImagePath");
        Part filePart = request.getPart("hinhAnh");

        // Nếu có ảnh mới, thay thế ảnh cũ
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePart.write(uploadPath + File.separator + fileName);
            hinhAnhPath = "uploads/" + fileName;
        }

        // Tạo đối tượng sản phẩm với ID để cập nhật
        Products product = new Products(productId, tenSanPham, moTa, gia, soLuongCon, hinhAnhPath);

        try {
            ProductDAO productDAO = new ProductDAO();
            int rowsAffected = productDAO.updateProduct(product);
            if (rowsAffected > 0) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                // Nếu cập nhật không thành công, gửi lại `product` về `addProduct.jsp`
                request.setAttribute("product", product);
                request.setAttribute("error", "Cập nhật không thành công.");
                request.getRequestDispatcher("addProduct.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("product", product);
            request.setAttribute("error", "Lỗi xảy ra khi cập nhật sản phẩm.");
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        }
    }
}
