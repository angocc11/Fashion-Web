package com.doan.Shop.Controller;

import com.doan.Shop.DAO.ProductDAO;
import com.doan.Shop.Model.Products;
import com.doan.Shop.DAO.ProductReviewDAO;
import com.doan.Shop.Model.Review;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ProductDetailsServlet")
public class ProductDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	    
    	response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String productIdParam = request.getParameter("ID");

    	    if (productIdParam != null && !productIdParam.isEmpty()) {
    	        int productId = Integer.parseInt(productIdParam);

    	        try {
    	            ProductDAO productDAO = new ProductDAO();
    	            Products product = productDAO.getProductById(productId);

    	            ProductReviewDAO reviewDAO = new ProductReviewDAO();
    	            List<Review> productReviews = reviewDAO.getReviewsByProductId(productId);
    	            int reviewCount = reviewDAO.getReviewCountByProductId(productId);
    	            double averageRating = reviewDAO.getAverageRatingByProductId(productId);

    	            // Đặt các thuộc tính để hiển thị trên JSP
    	            request.setAttribute("product", product);
    	            request.setAttribute("productReviews", productReviews);
    	            request.setAttribute("reviewCount", reviewCount);
    	            request.setAttribute("averageRating", averageRating);

    	            // Chuyển tiếp tới trang chi tiết sản phẩm
    	            request.getRequestDispatcher("productDetails.jsp").forward(request, response);

    	        } catch (SQLException e) {
    	            e.printStackTrace();
    	            // Chuyển hướng tới trang lỗi nếu xảy ra ngoại lệ
    	            response.sendRedirect("error.jsp");
    	        }
    	    } else {
    	        response.sendRedirect("index.jsp"); // Nếu thiếu ID, quay lại trang chính
    	    }
    	}

}
