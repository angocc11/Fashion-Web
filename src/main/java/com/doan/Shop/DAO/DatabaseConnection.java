package com.doan.Shop.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/doancntt?allowPublicKeyRetrieval=true&useSSL=false"
    		+ "";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "12345@abcde";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("Không tìm thấy driver MySQL.");
        }
    }

    public static Connection initializeDatabase() throws SQLException {
        return getConnection();
    }

	public static void closeConnection(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}