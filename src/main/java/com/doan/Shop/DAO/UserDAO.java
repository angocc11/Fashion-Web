package com.doan.Shop.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.doan.Shop.Model.Users;

public class UserDAO implements AutoCloseable {
	private Connection connection;

	// Constructor kết nối bằng DatabaseConnection
	public UserDAO() throws SQLException {
		this.connection = DatabaseConnection.getConnection();
	}

	// Lấy danh sách tất cả người dùng
	public List<Users> getAllUsers() throws SQLException {
		List<Users> users = new ArrayList<>();
		String query = "SELECT * FROM users";
		try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Users user = new Users();
				user.setID(rs.getInt("ID"));
				user.setTaiKhoan(rs.getString("TaiKhoan"));
				user.setMatKhau(rs.getString("MatKhau"));
				user.setTenNguoiMua(rs.getString("TenNguoiMua"));
				user.setEmail(rs.getString("Email"));
				user.setSdt(rs.getString("Sdt"));
				user.setDiaChi(rs.getString("DiaChi"));
				user.setChucVu(rs.getString("ChucVu"));
				users.add(user);
			}
		}
		return users;
	}

	// Lấy thông tin người dùng theo ID
	public Users getUserById(int userId) {
		Users user = null;
		try {
			String query = "SELECT * FROM users WHERE ID = ?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				user = new Users();
				user.setID(rs.getInt("ID"));
				user.setTaiKhoan(rs.getString("TaiKhoan"));
				user.setMatKhau(rs.getString("MatKhau"));
				user.setTenNguoiMua(rs.getString("TenNguoiMua"));
				user.setEmail(rs.getString("Email"));
				user.setSdt(rs.getString("Sdt"));
				user.setDiaChi(rs.getString("DiaChi"));
				user.setChucVu(rs.getString("ChucVu"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	// Kiểm tra đăng nhập
	public Users checkLogin(String username, String password) {
		Users user = null;
		String query = "SELECT * FROM users WHERE TaiKhoan = ? AND MatKhau = ?";
		try (PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setString(1, username);
			ps.setString(2, password);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					user = new Users();
					user.setID(rs.getInt("ID"));
					user.setTaiKhoan(rs.getString("TaiKhoan"));
					user.setMatKhau(rs.getString("MatKhau"));
					user.setTenNguoiMua(rs.getString("TenNguoiMua"));
					user.setEmail(rs.getString("Email"));
					user.setSdt(rs.getString("Sdt"));
					user.setDiaChi(rs.getString("DiaChi"));
					user.setChucVu(rs.getString("ChucVu"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	// Đăng ký người dùng mới
	public boolean registerUser(Users user) {
		boolean isRegistered = false;
		String query = "INSERT INTO users (TaiKhoan, MatKhau, TenNguoiMua, Email, Sdt, DiaChi, ChucVu) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try (PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setString(1, user.getTaiKhoan());
			ps.setString(2, user.getMatKhau());
			ps.setString(3, user.getTenNguoiMua());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getSdt());
			ps.setString(6, user.getDiaChi());
			ps.setString(7, user.getChucVu());
			ps.executeUpdate();
			isRegistered = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isRegistered;
	}

	public void updateUserProfile(int userId, String tenNguoiMua, String email, String sdt, String diaChi) {
		String query = "UPDATE users SET TenNguoiMua = ?, Email = ?, Sdt = ?, DiaChi = ? WHERE ID = ?";
		try (PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setString(1, tenNguoiMua);
			ps.setString(2, email);
			ps.setString(3, sdt);
			ps.setString(4, diaChi);
			ps.setInt(5, userId);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean checkGoogleIdExists(String googleId) {
		PreparedStatement pstmt = null;
		try {
			String checkQuery = "SELECT COUNT(*) FROM users WHERE google_id = ?";
			pstmt = connection.prepareStatement(checkQuery);
			pstmt.setString(1, googleId);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next() && rs.getInt(1) > 0) {
				return true; // Nếu đã tồn tại
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false; // Nếu chưa tồn tại
	}


	// Phương thức để lấy thông tin người dùng từ cơ sở dữ liệu (dựa vào email)
	public Users getUserByEmail(String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Users user = null;

		try {
			String query = "SELECT * FROM users WHERE Email = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				user = new Users(rs.getInt("ID"), rs.getString("TaiKhoan"), rs.getString("MatKhau"),
						rs.getString("TenNguoiMua"), rs.getString("Email"), rs.getString("Sdt"), rs.getString("DiaChi"),
						rs.getString("ChucVu"), query);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return user;
	}

	public void updatePassword(String googleId, String newPassword) {
		PreparedStatement pstmt = null;
		try {
			String updateQuery = "UPDATE users SET MatKhau = ? WHERE google_id = ?";
			pstmt = connection.prepareStatement(updateQuery);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, googleId);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public Users getAccountByEmailOrGoogleId(String email, String googleId) {
        try {
            String query = "SELECT * FROM users WHERE google_email = ? OR google_id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, googleId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Users user = new Users();
                user.setID(rs.getInt("ID"));
                user.setTaiKhoan(rs.getString("TaiKhoan"));
                user.setMatKhau(rs.getString("MatKhau"));
                user.setTenNguoiMua(rs.getString("TenNguoiMua"));
                user.setEmail(rs.getString("google_email"));
                user.setSdt(rs.getString("Sdt"));
                user.setDiaChi(rs.getString("DiaChi"));
                user.setChucVu(rs.getString("ChucVu"));
                user.setGoogleId(rs.getString("google_id"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Tạo mới người dùng
    public void createUser(Users user) {
        try {
            String query = "INSERT INTO users (TaiKhoan, MatKhau, TenNguoiMua, Email, google_id, google_email, ChucVu) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, user.getTaiKhoan());
            stmt.setString(2, user.getMatKhau());
            stmt.setString(3, user.getTenNguoiMua());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getGoogleId()); // Lưu google_id vào cơ sở dữ liệu
            stmt.setString(6, user.getEmail()); // Sử dụng email cho google_email
            stmt.setString(7, user.getChucVu());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean updateGoogleUserCredentials(String googleId, String username, String hashedPassword) {
        String query = "UPDATE users SET TaiKhoan = ?, MatKhau = ? WHERE google_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, username);
            ps.setString(2, hashedPassword);
            ps.setString(3, googleId);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

	// Đóng kết nối CSDL
	@Override
	public void close() {
		try {
			if (connection != null && !connection.isClosed()) {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void saveUser(Users newUser) {
		// TODO Auto-generated method stub
		
	}
}
