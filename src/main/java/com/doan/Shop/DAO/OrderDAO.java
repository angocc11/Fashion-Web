package com.doan.Shop.DAO;

import com.doan.Shop.Model.Orders;
import com.doan.Shop.Model.CartItem;
import com.doan.Shop.Model.Order_items;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class OrderDAO extends DatabaseConnection {

    // Phương thức lấy tất cả đơn hàng (dành cho Admin)
    public List<Orders> getAllOrders() throws SQLException {
        List<Orders> orders = new ArrayList<>();
        String query = "SELECT * FROM orders";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Orders order = new Orders(
                        rs.getInt("ID"),
                        rs.getInt("ID_NguoiMua"),
                        rs.getInt("TongSoLuong"),
                        rs.getInt("ThanhTien"),
                        rs.getString("TrangThai"),
                        rs.getTimestamp("NgayMua")
                );
                orders.add(order);
            }
        }
        return orders;
    }

    // Phương thức lấy các đơn hàng theo ID người dùng
    public List<Orders> getOrdersByUserId(int userId) throws SQLException {
        List<Orders> orders = new ArrayList<>();
        String query = "SELECT * FROM orders WHERE ID_NguoiMua = ?";

        try (Connection conn = DatabaseConnection.getConnection();  // Đảm bảo dùng `try-with-resources`
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Orders order = new Orders(
                            rs.getInt("ID"),
                            rs.getInt("ID_NguoiMua"),
                            rs.getInt("TongSoLuong"),
                            rs.getInt("ThanhTien"),
                            rs.getString("TrangThai"),
                            rs.getTimestamp("NgayMua")
                    );
                    orders.add(order);
                }
            }
        }
        return orders;
    }


    // Phương thức lấy chi tiết đơn hàng theo ID đơn hàng
    public List<Order_items> getOrderItemsByOrderId(int orderId) throws SQLException {
        List<Order_items> orderItems = new ArrayList<>();
        String query = "SELECT oi.ID, oi.order_id, oi.product_id, oi.SoLuong, oi.DonGia, p.TenSanPham " +
                       "FROM order_items oi " +
                       "JOIN products p ON oi.product_id = p.ID " +
                       "WHERE oi.order_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, orderId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Order_items item = new Order_items(
                            rs.getInt("ID"),
                            rs.getInt("order_id"),
                            rs.getInt("product_id"),
                            rs.getInt("SoLuong"),
                            rs.getInt("DonGia"),
                            rs.getString("TenSanPham") // Lấy tên sản phẩm từ bảng products
                    );
                    orderItems.add(item);
                }
            }
        }
        return orderItems;
    }

 // Kiểm tra số lượng sản phẩm còn trong kho
    public int getProductStock(int productId) throws SQLException {
        String query = "SELECT SoLuongCon FROM products WHERE ID = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("SoLuongCon");
                }
            }
        }
        return -1; // Trả về -1 nếu không tìm thấy sản phẩm
    }
 // Thêm đơn hàng mới
    public int insertOrder(int userId, int quantity, int totalPrice) throws SQLException {
        String query = "INSERT INTO orders (ID_NguoiMua, TongSoLuong, ThanhTien, TrangThai, NgayMua) VALUES (?, ?, ?, ?, NOW())";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, quantity);
            stmt.setInt(3, totalPrice);
            stmt.setString(4, "Pending");
            stmt.executeUpdate();

            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1); // Trả về ID của đơn hàng vừa thêm
                }
            }
        }
        return -1;
    }
 // Thêm chi tiết đơn hàng
    public boolean insertOrderItems(int orderId, int productId, int quantity, int price) throws SQLException {
        // Kiểm tra product_id có tồn tại trong bảng products
        if (getProductStock(productId) == -1) {
            throw new SQLException("Product ID không tồn tại: " + productId);
        }

        String query = "INSERT INTO order_items (order_id, product_id, SoLuong, DonGia) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, orderId);
            stmt.setInt(2, productId);
            stmt.setInt(3, quantity);
            stmt.setInt(4, price);
            return stmt.executeUpdate() > 0;
        }
    }


    
    // Cập nhật số lượng sản phẩm
    public boolean updateProductStock(int productId, int quantity) throws SQLException {
        String query = "UPDATE products SET SoLuongCon = SoLuongCon - ? WHERE ID = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, quantity);
            stmt.setInt(2, productId);
            return stmt.executeUpdate() > 0;
        }
    }
    public boolean updateOrderStatus(int orderId, String newStatus) throws SQLException {
        String updateStatusQuery = "UPDATE orders SET TrangThai = ? WHERE ID = ?";
        try (Connection connection = DatabaseConnection.initializeDatabase();
             PreparedStatement ps = connection.prepareStatement(updateStatusQuery)) {
            ps.setString(1, newStatus);
            ps.setInt(2, orderId);
            return ps.executeUpdate() > 0;
        }
    }
    //lấy trạng thái của order
    public String getOrderStatus(int orderId) throws SQLException {
        String query = "SELECT TrangThai FROM orders WHERE ID = ?";
        try (Connection connection = DatabaseConnection.initializeDatabase();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("TrangThai");
            }
        }
        return null; // Trả về null nếu không tìm thấy đơn hàng
    }

	/*
	 * public void saveOrder(Orders order, List<CartItem> cartItems) throws
	 * SQLException { // Sử dụng đối tượng 'order' để lưu vào bảng orders String
	 * query =
	 * "INSERT INTO orders (TenNguoiMua, Email, Sdt, TinhThanh, QuanHuyen, XaPhuong, Duong, GhiChu, PTThanhToan, ThanhTien) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
	 * ;
	 * 
	 * try (Connection conn = getConnection(); PreparedStatement stmt =
	 * conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
	 * 
	 * // Set giá trị cho các tham số trong câu truy vấn stmt.setString(1,
	 * order.getTenNguoiMua()); stmt.setString(2, order.getEmail());
	 * stmt.setString(3, order.getSdt()); stmt.setString(4, order.getTinhThanh());
	 * stmt.setString(5, order.getQuanHuyen()); stmt.setString(6,
	 * order.getXaPhuong()); stmt.setString(7, order.getDuong()); stmt.setString(8,
	 * order.getGhiChu()); stmt.setString(9, order.getPTThanhToan());
	 * stmt.setInt(10, order.getThanhTien());
	 * 
	 * // Thực thi câu lệnh INSERT vào bảng 'orders' stmt.executeUpdate();
	 * 
	 * // Lấy ID của đơn hàng vừa tạo để thêm chi tiết vào bảng 'order_items' try
	 * (ResultSet rs = stmt.getGeneratedKeys()) { if (rs.next()) { int orderId =
	 * rs.getInt(1); // ID của đơn hàng vừa được thêm vào // Lưu các sản phẩm trong
	 * giỏ hàng vào bảng order_items for (CartItem item : cartItems) {
	 * insertOrderItems(orderId, item.getProductId(), item.getSoLuong(),
	 * item.getGia()); } } } }
	 * 
	 * }
	 */
    
  //Xóa ôrder_item theo bảng products
    public void deleteOrderItemsByProductId(int productId) throws SQLException {
        String query = "DELETE FROM order_items WHERE product_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ps.executeUpdate();
        }
    }
    // Xóa orderItems theo OrderID (dùng trong xóa sản phẩm)
    public void deleteOrderItemsByOrderId(int orderId) throws SQLException {
        String query = "DELETE FROM order_items WHERE order_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, orderId);
            stmt.executeUpdate();
        }
    }
    // Xóa order theo id (dùng trong xóa sản phẩm)
    public boolean deleteOrderById(int orderId) throws SQLException {
        String query = "DELETE FROM orders WHERE ID = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, orderId);
            return stmt.executeUpdate() > 0;
        }
    }
    public void checkoutAll(int userId) throws SQLException {
        Connection conn = null;
        PreparedStatement psInsertOrder = null;
        PreparedStatement psInsertOrderItem = null;
        PreparedStatement psUpdateProductStock = null;
        PreparedStatement psDeleteCart = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection();
            conn.setAutoCommit(false); // Bắt đầu transaction

            // Lấy danh sách sản phẩm trong giỏ hàng
            CartDAO cartDAO = new CartDAO();
            List<CartItem> cartItems = cartDAO.getCartItemsByUserId(userId);

            if (cartItems.isEmpty()) {
                throw new SQLException("Giỏ hàng trống, không thể tiến hành mua.");
            }

            // Tính tổng số lượng và tổng tiền
            int totalQuantity = 0;
            int totalPrice = 0;

            for (CartItem item : cartItems) {
                totalQuantity += item.getSoLuong();
                totalPrice += item.getSoLuong() * item.getGia();
            }

            // Thêm đơn hàng vào bảng orders
            String insertOrderQuery = "INSERT INTO orders (ID_NguoiMua, TongSoLuong, ThanhTien, TrangThai) VALUES (?, ?, ?, ?)";
            psInsertOrder = conn.prepareStatement(insertOrderQuery, Statement.RETURN_GENERATED_KEYS);
            psInsertOrder.setInt(1, userId);
            psInsertOrder.setInt(2, totalQuantity);
            psInsertOrder.setInt(3, totalPrice);
            psInsertOrder.setString(4, "Pending");
            psInsertOrder.executeUpdate();

            // Lấy ID của đơn hàng vừa tạo
            rs = psInsertOrder.getGeneratedKeys();
            if (!rs.next()) {
                throw new SQLException("Không thể tạo đơn hàng.");
            }
            int orderId = rs.getInt(1);

            // Thêm từng sản phẩm vào bảng order_items và cập nhật số lượng tồn kho
            String insertOrderItemQuery = "INSERT INTO order_items (order_id, product_id, SoLuong, DonGia) VALUES (?, ?, ?, ?)";
            psInsertOrderItem = conn.prepareStatement(insertOrderItemQuery);

            String updateProductStockQuery = "UPDATE products SET SoLuongCon = SoLuongCon - ? WHERE ID = ?";
            psUpdateProductStock = conn.prepareStatement(updateProductStockQuery);

            for (CartItem item : cartItems) {
                // Thêm sản phẩm vào bảng order_items
                psInsertOrderItem.setInt(1, orderId); // ID đơn hàng
                psInsertOrderItem.setInt(2, item.getProductId()); // Đúng: ID sản phẩm
                psInsertOrderItem.setInt(3, item.getSoLuong()); // Số lượng
                psInsertOrderItem.setInt(4, item.getGia()); // Giá
                psInsertOrderItem.executeUpdate();

                // Cập nhật số lượng tồn kho sản phẩm
                psUpdateProductStock.setInt(1, item.getSoLuong());
                psUpdateProductStock.setInt(2, item.getProductId()); // Đúng: ID sản phẩm
                psUpdateProductStock.executeUpdate();
            }


            // Xóa toàn bộ sản phẩm trong giỏ hàng của người dùng
            String deleteCartQuery = "DELETE FROM giohang WHERE user_id = ?";
            psDeleteCart = conn.prepareStatement(deleteCartQuery);
            psDeleteCart.setInt(1, userId);
            psDeleteCart.executeUpdate();

            conn.commit(); // Xác nhận transaction
        } catch (SQLException e) {
            if (conn != null) {
                conn.rollback(); // Rollback nếu có lỗi xảy ra
            }
            throw e;
        } finally {
            if (rs != null) rs.close();
            if (psInsertOrder != null) psInsertOrder.close();
            if (psInsertOrderItem != null) psInsertOrderItem.close();
            if (psUpdateProductStock != null) psUpdateProductStock.close();
            if (psDeleteCart != null) psDeleteCart.close();
            if (conn != null) conn.close();
        }
    }



}

