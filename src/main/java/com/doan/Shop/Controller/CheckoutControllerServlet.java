package com.doan.Shop.Controller;

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

@WebServlet("/CheckoutControllerServlet")
public class CheckoutControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Lấy giỏ hàng từ CartDAO
            CartDAO cartDAO = new CartDAO();
            List<CartItem> cartItems = cartDAO.getCartItemsByUserId(userId);

            int totalAmount = 0;
            for (CartItem item : cartItems) {
                totalAmount += item.getThanhTien(); // Cộng dồn "Thành tiền" của mỗi sản phẩm
            }

            // Lấy phí vận chuyển từ session
            Integer shippingCost = (Integer) session.getAttribute("shippingCost");
            if (shippingCost == null) {
                shippingCost = 0; // Nếu chưa chọn shipping, mặc định là 0
            }

            // Tính tổng tiền (Tổng tiền + phí shipping)
            int totalWithShipping = 0;
            totalWithShipping += shippingCost;

            // Đặt các giá trị vào request để hiển thị trong trang checkout
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("totalAmount", totalAmount);
            request.setAttribute("shippingCost", shippingCost);
            request.setAttribute("totalWithShipping", totalWithShipping);

            // Chuyển tiếp tới trang checkout.jsp
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
