package com.doan.Shop.DAO;

import com.doan.Shop.Model.Review;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductReviewDAO {

    // Thêm đánh giá mới
    public void addReview(int productId, int userId, int rating, String reviewText) {
        String query = "INSERT INTO product_reviews (product_id, user_id, rating, review_text, review_date) VALUES (?, ?, ?, ?, NOW())";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ps.setInt(2, userId);
            ps.setInt(3, rating);
            ps.setString(4, reviewText);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy danh sách đánh giá theo product_id
    public List<Review> getReviewsByProductId(int productId) {
        List<Review> reviews = new ArrayList<>();
        String query = "SELECT * FROM product_reviews WHERE product_id = ? ORDER BY review_date DESC";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Review review = new Review(
                        rs.getInt("id"),
                        rs.getInt("product_id"),
                        rs.getInt("user_id"),
                        rs.getInt("rating"),
                        rs.getString("review_text"),
                        rs.getTimestamp("review_date")
                );
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    // Đếm tổng số đánh giá theo product_id
    public int getReviewCountByProductId(int productId) {
        String query = "SELECT COUNT(*) FROM product_reviews WHERE product_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Tính trung bình đánh giá theo product_id
    public double getAverageRatingByProductId(int productId) {
        String query = "SELECT AVG(rating) AS average_rating FROM product_reviews WHERE product_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getDouble("average_rating");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }
}
