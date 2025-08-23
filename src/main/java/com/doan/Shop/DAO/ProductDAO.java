package com.doan.Shop.DAO;

import com.doan.Shop.Model.Products;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
   

    // Biến connection lưu trữ kết nối cơ sở dữ liệu
    private Connection connection;

    public ProductDAO() throws SQLException {
        this.connection = DatabaseConnection.getConnection();
    }

 // Lấy danh sách tất cả sản phẩm
 	public List<Products> getAllProducts() {
 		List<Products> productList = new ArrayList<>();
 	    String query = "SELECT * FROM products ORDER BY SoLuongTruyCap DESC";
 		try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(query)) {

 			while (resultSet.next()) {
 				Products product = new Products();
 				product.setId(resultSet.getInt("ID"));
 				product.setTenSanPham(resultSet.getString("TenSanPham"));
 				product.setGia(resultSet.getInt("Gia"));
 				product.setMoTa(resultSet.getString("MoTa"));
 				product.setSoLuongCon(resultSet.getInt("SoLuongCon"));
 				product.setHinhAnh(resultSet.getString("HinhAnh")); // Thêm dòng này để lấy hình ảnh
 				productList.add(product);
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
 		return productList;
 	}
 	public int addProduct(Products product) throws SQLException {
 	    String query = "INSERT INTO products (TenSanPham, Gia, MoTa, SoLuongCon, LoaiSanPham, HinhAnh) VALUES (?, ?, ?, ?, ?, ?)";
 	    try (PreparedStatement ps = connection.prepareStatement(query)) {
 	        ps.setString(1, product.getTenSanPham());
 	        ps.setInt(2, product.getGia());
 	        ps.setString(3, product.getMoTa());
 	        ps.setInt(4, product.getSoLuongCon());
 	        ps.setString(5, product.getLoaiSanPham());  // Thêm loaiSanPham vào câu lệnh SQL
 	        ps.setString(6, product.getHinhAnh());
 	        return ps.executeUpdate();
 	    }
 	}



 	public int updateProduct(Products product) throws SQLException {
 		String query = "UPDATE products SET TenSanPham = ?, Gia = ?, MoTa = ?, SoLuongCon = ?, HinhAnh = ? WHERE ID = ?";
 		try (PreparedStatement ps = connection.prepareStatement(query)) {
 			ps.setString(1, product.getTenSanPham());
 			ps.setInt(2, product.getGia());
 			ps.setString(3, product.getMoTa());
 			ps.setInt(4, product.getSoLuongCon());
 			ps.setString(5, product.getHinhAnh());
 			ps.setInt(6, product.getId());
 			return ps.executeUpdate();
 		}
 	}

 	public void incrementViewCount(int productId) {
 		String query = "UPDATE products SET SoLuongTruyCap = SoLuongTruyCap + 1 WHERE ID = ?";
 		try (Connection conn = DatabaseConnection.getConnection();
 				PreparedStatement ps = conn.prepareStatement(query)) {
 			ps.setInt(1, productId);
 			ps.executeUpdate();
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
 	}

 	public void deleteProduct(int id) throws SQLException {
         String deleteReviewsQuery = "DELETE FROM product_reviews WHERE product_id = ?";
         String deleteProductQuery = "DELETE FROM products WHERE ID = ?";
         try (PreparedStatement deleteReviewsStmt = connection.prepareStatement(deleteReviewsQuery);
              PreparedStatement deleteProductStmt = connection.prepareStatement(deleteProductQuery)) {
              
             // Xóa các đánh giá liên quan đến sản phẩm
             deleteReviewsStmt.setInt(1, id);
             deleteReviewsStmt.executeUpdate();

             // Xóa sản phẩm
             deleteProductStmt.setInt(1, id);
             deleteProductStmt.executeUpdate();
         }
     }

 	// Tìm kiếm sản phẩm theo từ khóa
 	public List<Products> searchProducts(String keyword) {
 		List<Products> productList = new ArrayList<>();
 	    String query = "SELECT * FROM products WHERE TenSanPham LIKE ? ORDER BY SoLuongTruyCap DESC";
 		try (PreparedStatement statement = connection.prepareStatement(query)) {
 			statement.setString(1, "%" + keyword + "%");
 			ResultSet resultSet = statement.executeQuery();

 			while (resultSet.next()) {
 				Products product = new Products();
 				product.setId(resultSet.getInt("ID"));
 				product.setTenSanPham(resultSet.getString("TenSanPham"));
 				product.setGia(resultSet.getInt("Gia"));
 				product.setMoTa(resultSet.getString("MoTa"));
 				product.setSoLuongCon(resultSet.getInt("SoLuongCon"));
 				product.setHinhAnh(resultSet.getString("HinhAnh"));
 				productList.add(product);
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
 		return productList;
 	}

 	public Products getProductById(int id) {
 		Products product = null;
 		try {
 			String query = "SELECT * FROM products WHERE ID = ?"; // Đổi "id" thành "ID"
 			PreparedStatement ps = connection.prepareStatement(query);
 			ps.setInt(1, id);
 			ResultSet rs = ps.executeQuery();

 			if (rs.next()) {
 				product = new Products();
 				product.setId(rs.getInt("ID")); // Đồng bộ với thuộc tính "id"
 				product.setTenSanPham(rs.getString("TenSanPham"));
 				product.setMoTa(rs.getString("MoTa"));
 				product.setGia(rs.getInt("Gia"));
 				product.setSoLuongCon(rs.getInt("SoLuongCon"));
 				product.setHinhAnh(rs.getString("HinhAnh")); // Lấy hình ảnh từ cột HinhAnh
 				product.setSoLuongTruyCap(rs.getInt("SoLuongTruyCap"));

 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
 		return product;
 	}
 	public List<Products> getProductsByCategory(String category) {
 	    List<Products> productList = new ArrayList<>();
 	    String query = "SELECT * FROM products WHERE LoaiSanPham = ? ORDER BY SoLuongTruyCap DESC";
 	    try (PreparedStatement ps = connection.prepareStatement(query)) {
 	        ps.setString(1, category);
 	        ResultSet resultSet = ps.executeQuery();
 	        while (resultSet.next()) {
 	            Products product = new Products();
 	            product.setId(resultSet.getInt("ID"));
 	            product.setTenSanPham(resultSet.getString("TenSanPham"));
 	            product.setGia(resultSet.getInt("Gia"));
 	            product.setMoTa(resultSet.getString("MoTa"));
 	            product.setSoLuongCon(resultSet.getInt("SoLuongCon"));
 	            product.setHinhAnh(resultSet.getString("HinhAnh"));
 	            productList.add(product);
 	        }
 	    } catch (SQLException e) {
 	        e.printStackTrace();
 	    }
 	    return productList;
 	}
    public List<Products> searchProductsByCategory(String keyword, String category) {
        List<Products> productList = new ArrayList<>();
        String query = "SELECT * FROM products WHERE TenSanPham LIKE ? AND LoaiSanPham = ? ORDER BY SoLuongTruyCap DESC";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, category);
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                Products product = new Products();
                product.setId(resultSet.getInt("ID"));
                product.setTenSanPham(resultSet.getString("TenSanPham"));
                product.setGia(resultSet.getInt("Gia"));
                product.setMoTa(resultSet.getString("MoTa"));
                product.setSoLuongCon(resultSet.getInt("SoLuongCon"));
                product.setHinhAnh(resultSet.getString("HinhAnh"));
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    // Đóng kết nối cơ sở dữ liệu khi không sử dụng nữa
    public void closeConnection() {
		try {
			if (connection != null && !connection.isClosed()) {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
