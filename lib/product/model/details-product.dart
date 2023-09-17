// ignore_for_file: file_names

class DetailProduct {
  int? id;
  String? maPhieuNhap;
  String? maHangHoa;
  String? maNcc;
  int? soLuong;
  int? soLuongGoc;
  int? idTrangThai;
  int? giaNhap;
  String? ngaySanXuat;
  int? tgBaoQuan;
  String? createdAt;
  String? updatedAt;

  DetailProduct(
      {this.id,
      this.maPhieuNhap,
      this.maHangHoa,
      this.maNcc,
      this.soLuong,
      this.soLuongGoc,
      this.idTrangThai,
      this.giaNhap,
      this.ngaySanXuat,
      this.tgBaoQuan,
      this.createdAt,
      this.updatedAt});

  DetailProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maPhieuNhap = json['ma_phieu_nhap'];
    maHangHoa = json['ma_hang_hoa'];
    maNcc = json['ma_ncc'];
    soLuong = json['so_luong'];
    soLuongGoc = json['so_luong_goc'];
    idTrangThai = json['id_trang_thai'];
    giaNhap = json['gia_nhap'];
    ngaySanXuat = json['ngay_san_xuat'];
    tgBaoQuan = json['tg_bao_quan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ma_phieu_nhap'] = maPhieuNhap;
    data['ma_hang_hoa'] = maHangHoa;
    data['ma_ncc'] = maNcc;
    data['so_luong'] = soLuong;
    data['so_luong_goc'] = soLuongGoc;
    data['id_trang_thai'] = idTrangThai;
    data['gia_nhap'] = giaNhap;
    data['ngay_san_xuat'] = ngaySanXuat;
    data['tg_bao_quan'] = tgBaoQuan;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
