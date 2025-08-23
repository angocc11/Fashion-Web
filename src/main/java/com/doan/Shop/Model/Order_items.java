package com.doan.Shop.Model;

public class Order_items {
    private int ID;
    private int order_id;
    private int product_id;
    private int SoLuong;
    private int DonGia;
    private String tenSanPham; // Thêm thuộc tính tên sản phẩm

    public Order_items(int ID, int order_id, int product_id, int SoLuong, int DonGia) {
        this.ID = ID;
        this.order_id = order_id;
        this.product_id = product_id;
        this.SoLuong = SoLuong;
        this.DonGia = DonGia;
    }

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getSoLuong() {
		return SoLuong;
	}

	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}

	public int getDonGia() {
		return DonGia;
	}

	public void setDonGia(int donGia) {
		DonGia = donGia;
	}
	public String getTenSanPham() {
        return tenSanPham;
    }

	public Order_items(int iD, int order_id, int product_id, int soLuong, int donGia, String tenSanPham) {
		super();
		ID = iD;
		this.order_id = order_id;
		this.product_id = product_id;
		SoLuong = soLuong;
		DonGia = donGia;
		this.tenSanPham = tenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    // Getters and Setters...
    
}
