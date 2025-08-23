package com.doan.Shop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.doan.Shop.Model.CartItem;

public class CartDAO {

	public List<CartItem> getCartItemsByUserId(int userId) throws SQLException {
	    List<CartItem> cartItems = new ArrayList<>();
	    String query = "SELECT gh.ID, gh.product_id, gh.SoLuong, p.TenSanPham, p.Gia, p.HinhAnh " +
	                   "FROM giohang gh " +
	                   "JOIN products p ON gh.product_id = p.ID " +
	                   "WHERE gh.user_id = ?";
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(query)) {
	        stmt.setInt(1, userId);
	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                CartItem item = new CartItem();
	                item.setId(rs.getInt("ID")); // ID trong bảng giohang
	                item.setProductId(rs.getInt("product_id")); // ID sản phẩm
	                item.setSoLuong(rs.getInt("SoLuong")); // Số lượng trong giỏ hàng
	                item.setTenSanPham(rs.getString("TenSanPham")); // Tên sản phẩm
	                item.setGia(rs.getInt("Gia")); // Giá sản phẩm
	                item.setHinhAnh(rs.getString("HinhAnh")); // Hình ảnh sản phẩm
	                cartItems.add(item);
	            }
	        }
	    }
	    return cartItems;
	}


	public void addToCart(int userId, int productId, int soLuong) throws SQLException {
		// Kiểm tra xem sản phẩm đã có trong giỏ hàng của người dùng chưa
		String checkQuery = "SELECT id, soLuong FROM GioHang WHERE user_id = ? AND product_id = ?";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
			checkStmt.setInt(1, userId);
			checkStmt.setInt(2, productId);

			try (ResultSet rs = checkStmt.executeQuery()) {
				// Nếu sản phẩm đã có trong giỏ hàng
				if (rs.next()) {
					// Lấy id của sản phẩm trong giỏ hàng và số lượng hiện tại
					int cartItemId = rs.getInt("id");
					int currentQuantity = rs.getInt("soLuong");

					// Cập nhật số lượng của sản phẩm đó
					int newQuantity = currentQuantity + soLuong;

					String updateQuery = "UPDATE GioHang SET soLuong = ? WHERE id = ?";
					try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
						updateStmt.setInt(1, newQuantity);
						updateStmt.setInt(2, cartItemId);
						updateStmt.executeUpdate();
					}
				} else {
					// Nếu sản phẩm chưa có trong giỏ hàng, thêm sản phẩm mới
					String insertQuery = "INSERT INTO GioHang (user_id, product_id, soLuong) VALUES (?, ?, ?)";
					try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
						insertStmt.setInt(1, userId);
						insertStmt.setInt(2, productId);
						insertStmt.setInt(3, soLuong);
						insertStmt.executeUpdate();
					}
				}
			}
		}
	}

	public void updateQuantity(int cartItemId, int quantity) throws SQLException {
		String query = "UPDATE giohang SET soLuong = ? WHERE id = ?";
		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement ps = conn.prepareStatement(query)) {
			ps.setInt(1, quantity);
			ps.setInt(2, cartItemId);
			ps.executeUpdate();
		}
	}

	public void removeFromCart(int cartItemId) throws SQLException {
		String query = "DELETE FROM giohang WHERE id = ?";
		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement ps = conn.prepareStatement(query)) {
			ps.setInt(1, cartItemId);
			ps.executeUpdate();
		}
	}
	 public void deleteCartItemsByProductId(int productId) throws SQLException {
	        String query = "DELETE FROM giohang WHERE product_id = ?";
	        try (Connection conn = DatabaseConnection.getConnection();
	             PreparedStatement ps = conn.prepareStatement(query)) {
	            ps.setInt(1, productId);
	            ps.executeUpdate();
	        }
	    }
	    // Xóa toán bộ giỏ hàng của user 
	    public void removeFromCartByUserId(int userId) throws SQLException {
	        String query = "DELETE FROM giohang WHERE user_id = ?";
	        try (Connection conn = DatabaseConnection.getConnection();
	             PreparedStatement ps = conn.prepareStatement(query)) {
	            ps.setInt(1, userId);
	            ps.executeUpdate();
	        }
	    }
	    
}
