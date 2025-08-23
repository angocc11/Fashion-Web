package com.doan.Shop.Controller;

import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import com.doan.Shop.DAO.ProductReviewDAO;
import com.doan.Shop.Model.Review;
import java.io.IOException;
import java.util.List;
import javax.servlet.*;

@WebServlet("/ProductReviewServlet")
public class ProductReviewServlet extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String productIdParam = request.getParameter("productId");
	    String ratingParam = request.getParameter("rating");
	    String reviewText = request.getParameter("reviewText");

	    if (productIdParam == null || ratingParam == null || productIdParam.isEmpty() || ratingParam.isEmpty()) {
	        request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin đánh giá.");
	        request.getRequestDispatcher("productDetails.jsp").forward(request, response);
	        return;
	    }

	    HttpSession session = request.getSession();
	    Integer userId = (Integer) session.getAttribute("userId");
	    if (userId == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }

	    int productId = Integer.parseInt(productIdParam);
	    int rating = Integer.parseInt(ratingParam);

	    ProductReviewDAO reviewDAO = new ProductReviewDAO();
	    reviewDAO.addReview(productId, userId, rating, reviewText);

	    // Chuyển hướng về ProductDetailsServlet
	    response.sendRedirect("ProductDetailsServlet?ID=" + productId);
	}



	


}
