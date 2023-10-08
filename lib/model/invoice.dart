import 'package:ictu_mall_manager/model/product.dart';

class Invoice {
  final int? id;
  final String? maPhieuXuat;
  final String? khachHang;
  final String? donGia;
  final String? ngayXuat;
  final String? moTa;
  final int? idUser;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Product? hangHoa;

  Invoice({
    this.id,
    this.maPhieuXuat,
    this.khachHang,
    this.donGia,
    this.ngayXuat,
    this.moTa,
    this.idUser,
    this.createdAt,
    this.updatedAt,
    this.hangHoa,
  });

  factory Invoice.fromJson(Map<String?, dynamic> json) {
    return Invoice(
      id: json['id'],
      maPhieuXuat: json['ma_phieu_xuat'],
      khachHang: json['khach_hang'],
      donGia: json['don_gia'],
      ngayXuat: json['ngay_xuat'],
      moTa: json['mo_ta'],
      idUser: json['id_user'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      hangHoa: Product.fromJson(json['hang_hoa']),
    );
  }
}
