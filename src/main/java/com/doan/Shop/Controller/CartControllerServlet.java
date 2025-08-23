package com.doan.Shop.Controller;

import com.doan.Shop.DAO.CartDAO;
import com.doan.Shop.DAO.OrderDAO;

import com.doan.Shop.Model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/CartControllerServlet")
public class CartControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "viewCart"; // Mặc định xem giỏ hàng
        }

        try {
            switch (action) {
            case "removeFromCart":
                removeFromCart(request, response);
                break;
            case "viewCart":
            default:
                viewCart(request, response);
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
            case "addToCart":
                addToCart(request, response);
                break;
            case "updateQuantity":
                updateQuantity(request, response);
                break;
            case "updateShipping":
                updateShipping(request, response); // Xử lý cập nhật phí vận chuyển
                break;
            case "checkoutAll":
                checkoutAll(request, response);
                break;
            default:
                response.sendRedirect("error.jsp");
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));

        CartDAO cartDAO = new CartDAO();
        cartDAO.addToCart(userId, productId, soLuong);

        // Cập nhật giỏ hàng trong session
        List<CartItem> cartItems = cartDAO.getCartItemsByUserId(userId);
        session.setAttribute("cartItems", cartItems);

        response.sendRedirect("CartControllerServlet?action=viewCart");
    }

    private void updateQuantity(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int cartItemId = Integer.parseInt(request.getParameter("id"));
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));

        CartDAO cartDAO = new CartDAO();
        cartDAO.updateQuantity(cartItemId, soLuong);

        // Cập nhật lại giỏ hàng trong session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        List<CartItem> cartItems = cartDAO.getCartItemsByUserId(userId);
        session.setAttribute("cartItems", cartItems);

        response.sendRedirect("CartControllerServlet?action=viewCart");
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int cartItemId = Integer.parseInt(request.getParameter("id"));

        CartDAO cartDAO = new CartDAO();
        cartDAO.removeFromCart(cartItemId);

        // Cập nhật lại giỏ hàng trong session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        List<CartItem> cartItems = cartDAO.getCartItemsByUserId(userId);
        session.setAttribute("cartItems", cartItems);

        response.sendRedirect("CartControllerServlet?action=viewCart");
    }

    private void viewCart(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        CartDAO cartDAO = new CartDAO();
        List<CartItem> cartItems = cartDAO.getCartItemsByUserId(userId);

        int totalAmount = 0;
        for (CartItem item : cartItems) {
            totalAmount += item.getThanhTien(); // Cộng dồn "Thành tiền" của mỗi sản phẩm
        }

        // Lấy phí shipping từ session hoặc mặc định là 0
        Integer shippingCost = (Integer) session.getAttribute("shippingCost");
        if (shippingCost == null) {
            shippingCost = 0; // Nếu chưa chọn shipping, mặc định là 0
        }

        // Tính tổng tiền (Tổng tiền + phí shipping)
        int totalWithShipping = 0;
        totalWithShipping = shippingCost + totalAmount;
 
        // Lưu các giá trị cần thiết vào request để hiển thị trong JSP
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("shippingCost", shippingCost);
        request.setAttribute("totalWithShipping", totalWithShipping);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    private void updateShipping(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy giá trị phí vận chuyển từ form
        int shippingCost = Integer.parseInt(request.getParameter("shipping"));

        // Lưu phí shipping vào session để tính toán trong các bước sau
        session.setAttribute("shippingCost", shippingCost);

        // Sau khi cập nhật shipping, chuyển hướng lại về trang giỏ hàng
        response.sendRedirect("CartControllerServlet?action=viewCart");
    }
    //hàm mua toàn bộ giỏ hàng
    private void checkoutAll(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        CartDAO cartDAO = new CartDAO();
        OrderDAO orderDAO = new OrderDAO();

        // Lấy danh sách sản phẩm trong giỏ hàng
        List<CartItem> cartItems = cartDAO.getCartItemsByUserId(userId);
        if (cartItems.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        // Kiểm tra sản phẩm tồn tại và tồn kho
        for (CartItem item : cartItems) {
            int productStock = orderDAO.getProductStock(item.getProductId());
            if (productStock == -1) {
                response.getWriter().println("Sản phẩm không tồn tại: " + item.getTenSanPham());
                return;
            }
            if (item.getSoLuong() > productStock) {
                response.getWriter().println("Không đủ hàng trong kho cho sản phẩm: " + item.getTenSanPham());
                return;
            }
        }

        // Tính tổng số lượng và tổng tiền
        int totalQuantity = 0;
        int totalPrice = 0;
        for (CartItem item : cartItems) {
            totalQuantity += item.getSoLuong();
            totalPrice += item.getSoLuong() * item.getGia();
        }

        // Tạo hóa đơn mới
        int orderId = orderDAO.insertOrder(userId, totalQuantity, totalPrice);
        if (orderId == -1) {
            response.sendRedirect("error.jsp");
            return;
        }

        // Ghi nhận chi tiết hóa đơn và cập nhật kho
        for (CartItem item : cartItems) {
            boolean added = orderDAO.insertOrderItems(orderId, item.getProductId(), item.getSoLuong(), item.getGia());
            if (!added) {
                response.sendRedirect("error.jsp");
                return;
            }
            orderDAO.updateProductStock(item.getProductId(), item.getSoLuong());
        }

        // Xóa giỏ hàng sau khi thanh toán
        cartDAO.removeFromCartByUserId(userId);

        // Chuyển hướng đến trang xác nhận thanh toán thành công
        response.sendRedirect("checkoutSuccess.jsp");
    }
}
