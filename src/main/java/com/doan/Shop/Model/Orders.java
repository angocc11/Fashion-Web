package com.doan.Shop.Model;

import java.sql.Timestamp;

public class Orders {
    private int ID;
    private int ID_NguoiMua;
    private int TongSoLuong;
    private int ThanhTien;
    private String TrangThai;
    private Timestamp NgayMua;
    //private String TenNguoiMua;
    //private String Email;
    //private String Sdt;
    //private String TinhThanh;
    //private String QuanHuyen;
    //private String XaPhuong;
    //private String Duong;
    //private String GhiChu;
    //private String PTThanhToan;

    // Constructor sử dụng thông tin chi tiết đơn hàng
    public Orders(int ID, int ID_NguoiMua, int TongSoLuong, int ThanhTien, String TrangThai, Timestamp NgayMua) {
        this.ID = ID;
        this.ID_NguoiMua = ID_NguoiMua;
        this.TongSoLuong = TongSoLuong;
        this.ThanhTien = ThanhTien;
        this.TrangThai = TrangThai;
        this.NgayMua = NgayMua;
    }

	// Constructor sử dụng thông tin từ form đặt hàng
	/*
	 * public Orders(String fullName, String email, String phone, String city,
	 * String district, String ward, String streetAddress, String notes, String
	 * paymentMethod, int totalAmount) { this.TenNguoiMua = fullName; this.Email =
	 * email; this.Sdt = phone; this.TinhThanh = city; this.QuanHuyen = district;
	 * this.XaPhuong = ward; this.Duong = streetAddress; this.GhiChu = notes;
	 * this.PTThanhToan = paymentMethod; this.ThanhTien = totalAmount; }
	 */

    public Orders(int iD, int tongSoLuong, int thanhTien, String trangThai, Timestamp ngayMua) {
		super();
		ID = iD;
		TongSoLuong = tongSoLuong;
		ThanhTien = thanhTien;
		TrangThai = trangThai;
		NgayMua = ngayMua;
	}

	/*
	 * public Orders(int iD, int iD_NguoiMua, int tongSoLuong, int thanhTien, String
	 * trangThai, Timestamp ngayMua, String tenNguoiMua, String email, String sdt,
	 * String tinhThanh, String quanHuyen, String xaPhuong, String duong, String
	 * ghiChu, String pTThanhToan) { super(); ID = iD; ID_NguoiMua = iD_NguoiMua;
	 * TongSoLuong = tongSoLuong; ThanhTien = thanhTien; TrangThai = trangThai;
	 * NgayMua = ngayMua; TenNguoiMua = tenNguoiMua; Email = email; Sdt = sdt;
	 * TinhThanh = tinhThanh; QuanHuyen = quanHuyen; XaPhuong = xaPhuong; Duong =
	 * duong; GhiChu = ghiChu; PTThanhToan = pTThanhToan; }
	 * 
	 * public String getTenNguoiMua() { return TenNguoiMua; }
	 * 
	 * public void setTenNguoiMua(String tenNguoiMua) { TenNguoiMua = tenNguoiMua; }
	 * 
	 * public String getEmail() { return Email; }
	 * 
	 * public void setEmail(String email) { Email = email; }
	 * 
	 * public String getSdt() { return Sdt; }
	 * 
	 * public void setSdt(String sdt) { Sdt = sdt; }
	 * 
	 * public String getTinhThanh() { return TinhThanh; }
	 * 
	 * public void setTinhThanh(String tinhThanh) { TinhThanh = tinhThanh; }
	 * 
	 * public String getQuanHuyen() { return QuanHuyen; }
	 * 
	 * public void setQuanHuyen(String quanHuyen) { QuanHuyen = quanHuyen; }
	 * 
	 * public String getXaPhuong() { return XaPhuong; }
	 * 
	 * public void setXaPhuong(String xaPhuong) { XaPhuong = xaPhuong; }
	 * 
	 * public String getDuong() { return Duong; }
	 * 
	 * public void setDuong(String duong) { Duong = duong; }
	 * 
	 * public String getGhiChu() { return GhiChu; }
	 * 
	 * public void setGhiChu(String ghiChu) { GhiChu = ghiChu; }
	 * 
	 * public String getPTThanhToan() { return PTThanhToan; }
	 * 
	 * public void setPTThanhToan(String pTThanhToan) { PTThanhToan = pTThanhToan; }
	 */

	public void setID(int iD) {
		ID = iD;
	}

	public void setID_NguoiMua(int iD_NguoiMua) {
		ID_NguoiMua = iD_NguoiMua;
	}

	public void setTongSoLuong(int tongSoLuong) {
		TongSoLuong = tongSoLuong;
	}

	public void setThanhTien(int thanhTien) {
		ThanhTien = thanhTien;
	}

	public void setTrangThai(String trangThai) {
		TrangThai = trangThai;
	}

	public void setNgayMua(Timestamp ngayMua) {
		NgayMua = ngayMua;
	}

	// Getter and Setter methods
    public int getID() {
        return ID;
    }

    public int getID_NguoiMua() {
        return ID_NguoiMua;
    }

    public int getTongSoLuong() {
        return TongSoLuong;
    }

    public int getThanhTien() {
        return ThanhTien;
    }

    public String getTrangThai() {
        return TrangThai;
    }

    public Timestamp getNgayMua() {
        return NgayMua;
    }

    
}
