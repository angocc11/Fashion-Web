package com.doan.Shop.Model;

public class Users {
    int ID;
    String TaiKhoan;
    String MatKhau;
    String TenNguoiMua;
    String Email;
    String Sdt;
    String DiaChi;
    String ChucVu;
    String GoogleId; // Thêm trường GoogleId

    public int getID() {
        return ID;
    }
    public void setID(int ID) {
        this.ID = ID;
    }
    public String getTaiKhoan() {
        return TaiKhoan;
    }
    public void setTaiKhoan(String TaiKhoan) {
        this.TaiKhoan = TaiKhoan;
    }
    public String getMatKhau() {
        return MatKhau;
    }
    public void setMatKhau(String MatKhau) {
        this.MatKhau = MatKhau;
    }
    public String getTenNguoiMua() {
        return TenNguoiMua;
    }
    public void setTenNguoiMua(String TenNguoiMua) {
        this.TenNguoiMua = TenNguoiMua;
    }
    public String getEmail() {
        return Email;
    }
    public void setEmail(String Email) {
        this.Email = Email;
    }
    public String getSdt() {
        return Sdt;
    }
    public void setSdt(String Sdt) {
        this.Sdt = Sdt;
    }
    public String getDiaChi() {
        return DiaChi;
    }
    public void setDiaChi(String DiaChi) {
        this.DiaChi = DiaChi;
    }
    public String getChucVu() {
        return ChucVu;
    }
    public void setChucVu(String ChucVu) {
        this.ChucVu = ChucVu;
    }
    public String getGoogleId() {
        return GoogleId; // Getter cho GoogleId
    }
    public void setGoogleId(String GoogleId) {
        this.GoogleId = GoogleId; // Setter cho GoogleId
    }

    // Constructor có tham số
    public Users(int ID, String TaiKhoan, String MatKhau, String TenNguoiMua, String Email, String Sdt, String DiaChi,
            String ChucVu, String GoogleId) {
        super();
        this.ID = ID;
        this.TaiKhoan = TaiKhoan;
        this.MatKhau = MatKhau;
        this.TenNguoiMua = TenNguoiMua;
        this.Email = Email;
        this.Sdt = Sdt;
        this.DiaChi = DiaChi;
        this.ChucVu = ChucVu;
        this.GoogleId = GoogleId;
    }

    // Constructor không tham số
    public Users() {
        super();
    }
}
