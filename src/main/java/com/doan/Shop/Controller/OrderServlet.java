package com.doan.Shop.Controller;

import com.doan.Shop.DAO.OrderDAO;
import com.doan.Shop.Model.Orders;
import com.doan.Shop.Model.Order_items;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderDAO orderDAO = new OrderDAO();  // Thay đổi đối tượng orderDAO

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");

        if ("updateStatus".equals(action)) {
            // Cập nhật trạng thái đơn hàng
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String newStatus = request.getParameter("newStatus");

            try {
                if (!"Cancelled".equals(orderDAO.getOrderStatus(orderId))) {
                    orderDAO.updateOrderStatus(orderId, newStatus);
                    response.sendRedirect("OrderServlet");
                } else {
                    response.getWriter().println("Đơn hàng đã bị hủy và không thể cập nhật trạng thái.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Đã xảy ra lỗi khi cập nhật trạng thái đơn hàng.");
            }
            return;
        } else if ("cancelOrder".equals(action)) {
            // Xử lý hủy đơn hàng
            int orderId = Integer.parseInt(request.getParameter("orderId"));

            try {
                String currentStatus = orderDAO.getOrderStatus(orderId);
                if (currentStatus != null && !"Cancelled".equals(currentStatus)) {
                    orderDAO.updateOrderStatus(orderId, "Cancelled");
                    response.sendRedirect("OrderServlet");
                } else {
                    response.getWriter().println("Đơn hàng đã bị hủy trước đó.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Đã xảy ra lỗi khi hủy đơn hàng.");
            }
            return;
        }

        // Xử lý đặt hàng
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int price = Integer.parseInt(request.getParameter("price"));

            if (quantity <= 0) {
                response.getWriter().println("Số lượng đặt phải lớn hơn 0.");
                return;
            }

            int currentStock = orderDAO.getProductStock(productId);

            if (currentStock == -1) {
                response.getWriter().println("Sản phẩm không tồn tại.");
                return;
            }

            if (quantity > currentStock) {
                response.getWriter().println("Không đủ hàng trong kho.");
                return;
            }

            // Chuyển đổi price từ int thành BigDecimal
            int orderId = orderDAO.insertOrder(userId, quantity, price * quantity);
            if (orderId == -1) {
                response.getWriter().println("Đã xảy ra lỗi khi thêm đơn hàng.");
                return;
            }

            if (orderDAO.insertOrderItems(orderId, productId, quantity, price) && 
                orderDAO.updateProductStock(productId, quantity)) {
                response.getWriter().println("Đặt hàng thành công!");
            } else {
                response.getWriter().println("Đã xảy ra lỗi khi đặt hàng.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Đã xảy ra lỗi khi đặt hàng.");
        } catch (NumberFormatException e) {
            response.getWriter().println("Thiếu tham số productId, quantity hoặc price.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            List<Orders> orders;
            String targetPage;

            if ("ADMIN".equalsIgnoreCase(role)) {
                orders = orderDAO.getAllOrders();
                targetPage = "/adminOrder.jsp";
            } else {
                orders = orderDAO.getOrdersByUserId(userId);
                targetPage = "/userOrder.jsp";
            }
            request.setAttribute("orders", orders);

            Map<Integer, List<Order_items>> orderItemsMap = new HashMap<>();
            for (Orders order : orders) {
                List<Order_items> orderItems = orderDAO.getOrderItemsByOrderId(order.getID());
                orderItemsMap.put(order.getID(), orderItems);
            }
            request.setAttribute("orderItemsMap", orderItemsMap);

            request.getRequestDispatcher(targetPage).forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
