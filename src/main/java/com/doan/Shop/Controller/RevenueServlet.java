package com.doan.Shop.Controller;

import com.doan.Shop.DAO.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/RevenueServlet")
public class RevenueServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra nếu không có tham số "type", điều hướng đến "day" mặc định
        String type = request.getParameter("type");
        if (type == null || type.isEmpty()) {
            response.sendRedirect("RevenueServlet?type=day");
            return;
        }

        List<Map<String, Object>> revenueData = new ArrayList<>();
        try (Connection connection = DatabaseConnection.initializeDatabase();
             PreparedStatement ps = connection.prepareStatement(getQueryByType(type));
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                if ("month".equals(type)) {
                    row.put("month", rs.getInt("month"));
                    row.put("year", rs.getInt("year"));
                } else {
                    row.put("date", rs.getDate("date"));
                }
                row.put("revenue", rs.getInt("revenue"));
                row.put("order_count", rs.getInt("order_count"));
                revenueData.add(row);
            }

            request.setAttribute("revenueData", revenueData);
            request.setAttribute("type", type);
            request.getRequestDispatcher("revenueReport.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private String getQueryByType(String type) {
        return "month".equals(type)
            ? "SELECT MONTH(NgayMua) AS month, YEAR(NgayMua) AS year, SUM(ThanhTien) AS revenue, COUNT(ID) AS order_count " +
              "FROM orders WHERE TrangThai = 'Completed' GROUP BY year, month ORDER BY year DESC, month DESC"
            : "SELECT DATE(NgayMua) AS date, SUM(ThanhTien) AS revenue, COUNT(ID) AS order_count " +
              "FROM orders WHERE TrangThai = 'Completed' GROUP BY date ORDER BY date DESC";
    }
}
