// ignore_for_file: file_names

import 'dart:convert';
import 'package:ictu_mall_manager/api/api.dart';
import 'package:ictu_mall_manager/local/save-local.dart';
import 'package:ictu_mall_manager/product/model/details-product.dart';
import 'package:ictu_mall_manager/product/model/list-product-model.dart';
import 'package:http/http.dart' as http;
import 'package:ictu_mall_manager/product/model/product.dart';

class ProductController {
  Future<ListProduct> getListProduct() async {
    ListProduct listProduct = ListProduct();
    SaveLocal saveLocal = SaveLocal();

    getTokenInLocal() async {
      var token = await saveLocal.readDataToLocal('token');
      return token;
    }

    try {
      var token = await getTokenInLocal();
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      var res = await http.get(
        Uri.parse(API.getListProductAPI),
        headers: headers,
      );
      if (res.statusCode == 200) {
        var resProduct = jsonDecode(res.body);
        List<DetailProduct> details = [];

        for (var productData in resProduct['data']) {
          var detailsData = productData['details'];

          for (var detailData in detailsData) {
            var detailProduct = DetailProduct(
              id: detailData['id'],
              maPhieuNhap: detailData['ma_phieu_nhap'],
              maHangHoa: detailData['ma_hang_hoa'],
              maNcc: detailData['ma_ncc'],
              soLuong: detailData['so_luong'],
              soLuongGoc: detailData['so_luong_goc'],
              idTrangThai: detailData['id_trang_thai'],
              giaNhap: detailData['gia_nhap'],
              ngaySanXuat: detailData['ngay_san_xuat'],
              tgBaoQuan: detailData['tg_bao_quan'],
              createdAt: detailData['created_at'],
              updatedAt: detailData['updated_at'],
            );

            if (detailProduct.soLuong != 0) {
              details.add(detailProduct);
            }
          }


          var product = Product(
            id: productData['id'],
            maHangHoa: productData['ma_hang_hoa'],
            tenHangHoa: productData['ma_hang_hoa'],
            moTa: productData['mo_ta'],
            idLoaiHang: productData['id_loai_hang'],
            donViTinh: productData['don_vi_tinh'],
            barcode: productData['barcode'],
            img: productData['img'],
            createdAt: productData['created_at'],
            updatedAt: productData['updated_at'],
            tong: productData['tong'],
            details: details,
          );

          listProduct = ListProduct(data: [product]);
          print(listProduct.toJson());
        }
      }
    } catch (exception) {
      print(exception.toString());
    }

    return listProduct;
  }
}
