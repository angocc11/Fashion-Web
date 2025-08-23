package com.doan.Shop.Model;

public class Products {
    private int id;
    private String tenSanPham;
    private String moTa;
    private int gia;  // Đã chuyển sang kiểu int
    private int soLuongCon;
    private String hinhAnh;  // Trường mới cho hình ảnh
    int soLuongTruyCap;
    private String loaiSanPham; // Thêm thuộc tính này

    public Products(int id, String tenSanPham, String moTa, int gia, int soLuongCon) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.moTa = moTa;
        this.gia = gia;
        this.soLuongCon = soLuongCon;
    }
    public Products(int id, String tenSanPham, String moTa, int gia, int soLuongCon, String hinhAnh,
			int soLuongTruyCap) {
		super();
		this.id = id;
		this.tenSanPham = tenSanPham;
		this.moTa = moTa;
		this.gia = gia;
		this.soLuongCon = soLuongCon;
		this.hinhAnh = hinhAnh;
		this.soLuongTruyCap = soLuongTruyCap;
	}
	public int getSoLuongTruyCap() {
		return soLuongTruyCap;
	}
	public void setSoLuongTruyCap(int soLuongTruyCap) {
		this.soLuongTruyCap = soLuongTruyCap;
	}
	public Products(int id, String tenSanPham, String moTa, int gia, int soLuongCon, String hinhAnh) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.moTa = moTa;
        this.gia = gia;
        this.soLuongCon = soLuongCon;
        this.hinhAnh = hinhAnh;
    }
    
    public Products() {
		super();
	}
    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }
	// Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    public int getSoLuongCon() {
        return soLuongCon;
    }

    public void setSoLuongCon(int soLuongCon) {
        this.soLuongCon = soLuongCon;
    }
    public String getLoaiSanPham() {
        return loaiSanPham;
    }

    public void setLoaiSanPham(String loaiSanPham) {
        this.loaiSanPham = loaiSanPham;
    }
	public Products(int id, String tenSanPham, String moTa, int gia, int soLuongCon,String loaiSanPham, String hinhAnh, int soLuongTruyCap) 
	{
		super();
		this.id = id;
		this.tenSanPham = tenSanPham;
		this.moTa = moTa;
		this.gia = gia;
		this.soLuongCon = soLuongCon;
		this.loaiSanPham = loaiSanPham;
		this.hinhAnh = hinhAnh;
		this.soLuongTruyCap = soLuongTruyCap;
		
	}
	public Products(int id, String tenSanPham, String moTa, int gia, int soLuongCon, String loaiSanPham, String hinhAnh) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.moTa = moTa;
        this.gia = gia;
        this.soLuongCon = soLuongCon;
        this.loaiSanPham = loaiSanPham;
        this.hinhAnh = hinhAnh;
    }


	
}
