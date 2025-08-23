package com.doan.Shop.Controller;

import com.doan.Shop.DAO.ProductDAO;
import com.doan.Shop.Model.Products;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ProductListServlet")
public class ProductListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        ProductDAO productDAO = null;
        try {
            productDAO = new ProductDAO();
            String keyword = request.getParameter("keyword");
            String loaiSanPham = request.getParameter("loaiSanPham");
            List<Products> productList;
            
            // Gán giá trị keyword và loaiSanPham vào request để hiển thị trong giao diện
            request.setAttribute("debugKeyword", keyword);
            request.setAttribute("debugLoaiSanPham", loaiSanPham);

            if (keyword != null && !keyword.trim().isEmpty() && loaiSanPham != null && !loaiSanPham.trim().isEmpty()) {
                // Tìm kiếm theo cả từ khóa và loại sản phẩm
                productList = productDAO.searchProductsByCategory(keyword, loaiSanPham);
            } else if (keyword != null && !keyword.trim().isEmpty()) {
                // Tìm kiếm theo từ khóa
                productList = productDAO.searchProducts(keyword);
            } else if (loaiSanPham != null && !loaiSanPham.trim().isEmpty()) {
                // Tìm kiếm theo loại sản phẩm
                productList = productDAO.getProductsByCategory(loaiSanPham);
            } else {
                // Lấy toàn bộ sản phẩm
                productList = productDAO.getAllProducts();
            }

            request.setAttribute("products", productList);
            request.setAttribute("keyword", keyword);
            request.setAttribute("loaiSanPham", loaiSanPham);

            // Chuyển hướng kết quả tìm kiếm về trang index.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Lỗi kết nối cơ sở dữ liệu", e);
        } finally {
            if (productDAO != null) {
                productDAO.closeConnection();
            }
        }
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productIdParam = request.getParameter("productId");
        if (productIdParam != null) {
            int productId = Integer.parseInt(productIdParam);
            ProductDAO productDAO = null;
            try {
                productDAO = new ProductDAO();
                productDAO.incrementViewCount(productId); // Tăng lượt xem cho sản phẩm
                response.setStatus(HttpServletResponse.SC_OK); // Trả về trạng thái thành công
            } catch (SQLException e) {  // Only catch SQLException
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi tăng lượt xem.");
            } finally {
                if (productDAO != null) {
                    productDAO.closeConnection();
                }
            }
        }
    }

}
