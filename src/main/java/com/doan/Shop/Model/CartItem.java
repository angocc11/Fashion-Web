package com.doan.Shop.Model;
import java.io.Serializable;


public class CartItem implements Serializable{
    private int id;
    private int productId;
    private int soLuong;
    private String tenSanPham;    // Thêm thuộc tính mới
    private int gia;       // Thêm thuộc tính mới
    private String hinhAnh;  // Thêm thuộc tính hình ảnh
    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }
    // Getters và setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }
    public int getThanhTien() {
        return gia *soLuong;  // Giá * Số lượng
    }

}
