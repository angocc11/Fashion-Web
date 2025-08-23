package com.doan.Shop.Controller;

import com.doan.Shop.DAO.CartDAO;
import com.doan.Shop.DAO.ProductDAO;
import com.doan.Shop.DAO.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy productId từ request
            int productId = Integer.parseInt(request.getParameter("id"));

            // Tạo các DAO
            ProductDAO productDAO = new ProductDAO();
            CartDAO cartDAO = new CartDAO();
            OrderDAO orderDAO = new OrderDAO();

            // Xóa các bản ghi liên quan
            cartDAO.deleteCartItemsByProductId(productId);
            orderDAO.deleteOrderItemsByProductId(productId);

            // Xóa sản phẩm và đánh giá liên quan
            productDAO.deleteProduct(productId);

            // Chuyển hướng về dashboard
            response.sendRedirect("adminDashboard.jsp?message=ProductDeleted");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=InvalidProductId");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=SQLException");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=DeleteFailed");
        }
    }
}
