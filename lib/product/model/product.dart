import 'package:ictu_mall_manager/product/model/details-product.dart';

class Product {
  int? id;
  String? maHangHoa;
  String? tenHangHoa;
  String? moTa;
  int? idLoaiHang;
  String? donViTinh;
  int? barcode;
  String? img;
  String? createdAt;
  String? updatedAt;
  int? tong;
  List<DetailProduct>? details;

  Product(
      {this.id,
      this.maHangHoa,
      this.tenHangHoa,
      this.moTa,
      this.idLoaiHang,
      this.donViTinh,
      this.barcode,
      this.img,
      this.createdAt,
      this.updatedAt,
      this.tong,
      this.details});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maHangHoa = json['ma_hang_hoa'];
    tenHangHoa = json['ten_hang_hoa'];
    moTa = json['mo_ta'];
    idLoaiHang = json['id_loai_hang'];
    donViTinh = json['don_vi_tinh'];
    barcode = json['barcode'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tong = json['tong'];
    if (json['details'] != null) {
      details = <DetailProduct>[];
      json['details'].forEach((v) {
        details!.add(DetailProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ma_hang_hoa'] = maHangHoa;
    data['ten_hang_hoa'] = tenHangHoa;
    data['mo_ta'] = moTa;
    data['id_loai_hang'] = idLoaiHang;
    data['don_vi_tinh'] = donViTinh;
    data['barcode'] = barcode;
    data['img'] = img;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['tong'] = tong;
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
