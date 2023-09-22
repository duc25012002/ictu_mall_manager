class Product {
  final int id;
  final String maHangHoa;
  final String tenHangHoa;
  final String moTa;
  final int idLoaiHang;
  final String donViTinh;
  final String giaBan;
  final String barcode;
  final String img;

  Product({
    required this.id,
    required this.maHangHoa,
    required this.tenHangHoa,
    required this.moTa,
    required this.idLoaiHang,
    required this.donViTinh,
    required this.giaBan,
    required this.barcode,
    required this.img,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      maHangHoa: json['ma_hang_hoa'],
      tenHangHoa: json['ten_hang_hoa'],
      moTa: json['mo_ta'],
      idLoaiHang: json['id_loai_hang'],
      donViTinh: json['don_vi_tinh'],
      giaBan: json['gia_ban'],
      barcode: json['barcode'],
      img: json['img'],
    );
  }
}
