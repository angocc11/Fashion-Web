package com.doan.Shop.DAO;

import java.sql.*;

public class Testdb {
    public static String USERNAME = "root";
    public static String PASSWORD = "12345@abcde!!";
    public static String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static String URL = "jdbc:mysql://localhost:3306/doancntt?useSSL=false";

    // Phương thức để lấy kết nối cơ sở dữ liệu
    public static Connection getDatabaseConnection() throws SQLException, ClassNotFoundException {
        try {
            Class.forName(DRIVER);
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public static void main(String[] args) {
        try (Connection connection = Testdb.getDatabaseConnection()) {
            System.out.println(connection != null ? "Connection successful!" : "Failed to connect.");

            // Chỉ lấy dữ liệu từ bảng Products
            String tableName = "Products";
            System.out.println("\nDữ liệu trong bảng: " + tableName);

            // Truy vấn tất cả dữ liệu từ bảng Products
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM " + tableName);

            // Lấy metadata để biết số cột và tên cột
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();

            // In tên các cột
            for (int i = 1; i <= columnCount; i++) {
                System.out.print(metaData.getColumnName(i) + "\t");
            }
            System.out.println();

            // In dữ liệu trong bảng Products
            while (resultSet.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    System.out.print(resultSet.getString(i) + "\t");
                }
                System.out.println();
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
