// ignore_for_file: file_names, unused_element

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/local/save-local.dart';
import 'package:ictu_mall_manager/model/invoice.dart';
import 'package:ictu_mall_manager/model/product.dart';

class HistoryController {
  SaveLocal saveLocal = SaveLocal();
  Invoice? invoice;
  getTokenInLocal() async {
    var token = await saveLocal.readDataToLocal('token');
    return token;
  }

  Future<List<Invoice>> getDataHistory() async {
    List<Invoice> invoices = [];

    try {
      var token = await getTokenInLocal();
      final headers = {
        'Authorization': 'Bearer $token',
      };

      final response = await http.post(
        Uri.parse(GET_LIST_HIS),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var resHistory = jsonDecode(response.body);

        for (var element in resHistory["data"]) {
          print(element["hang_hoa"]["id"]);
          Product product = Product(
            maHangHoa: element["hang_hoa"]["ma_hang_hoa"],
            tenHangHoa: element["hang_hoa"]["ten_hang_hoa"],
            idLoaiHang: element["hang_hoa"]["id_loai_hang"],
            donViTinh: element["hang_hoa"]["don_vi_tinh"],
            giaBan: element["hang_hoa"]["gia_ban"],
            barcode: element["hang_hoa"]["barcode"],
            img: element["hang_hoa"]["img"],
          );

          Invoice invoice = Invoice(
            id: element['id'],
            maPhieuXuat: element['ma_phieu_xuat'],
            khachHang: element['khach_hang'],
            ngayXuat: element['ngay_xuat'],
            hangHoa: product,
          );
          invoices.add(invoice);
        }
        print(invoices);
      } else {
        print('Lỗi: ${response.statusCode}');
      }
    } catch (exception) {
      print(exception.toString());
    }
    return invoices;
  }
}
