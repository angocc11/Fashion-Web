package com.doan.Shop.Controller;

import com.doan.Shop.DAO.OrderDAO;
import com.doan.Shop.DAO.CartDAO;
import com.doan.Shop.Model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ConfirmOrderServlet")
public class ConfirmOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        CartDAO cartDAO = new CartDAO();

        try {
            // Lấy danh sách sản phẩm từ giỏ hàng
            List<CartItem> cartItems = cartDAO.getCartItemsByUserId(userId);
            if (cartItems.isEmpty()) {
                request.setAttribute("message", "Giỏ hàng trống. Không thể thanh toán.");
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
                return;
            }

            // Gọi hàm checkoutAll để xử lý thanh toán
            orderDAO.checkoutAll(userId);

            // Xóa giỏ hàng khỏi session
            session.removeAttribute("cartItems");

            // Chuyển hướng đến trang xác nhận
            response.sendRedirect("checkoutSuccess.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
