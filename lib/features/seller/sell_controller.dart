// ignore_for_file: file_names, unused_import, unnecessary_string_interpolations
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/local/save_local.dart';
import 'package:just_audio/just_audio.dart';

class SellController {
  final player = AudioPlayer();

  Future<void> scanQrAPI(String searchTerm) async {
    final Uri uri = Uri.parse(POST_BAR_CODE);
    await player.setAsset('assets/audio/bip_bip.mp3');
    final Map<String, String> params = {'maSanPham': searchTerm};

    print(uri.replace(queryParameters: params));
    final response = await http.get(uri.replace(queryParameters: params));

    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Thành công');
      await player.play();
      await player.pause();
    } else {
      player.stop();
      throw Exception(response.body);
    }
  }

  Future<void> scanQrApiInput(String searchTerm) async {
    final Uri uri = Uri.parse(POST_BAR_CODE_ADD_PRODUCT);

    SaveLocal saveLocal = SaveLocal();
    String token = await saveLocal.readDataToLocal('token');

    await player.setAsset('assets/audio/bip_bip.mp3');
    int id = await getIdAddProduct();
    final Map<String, String> params = {
      'phien_nhap_hang_id': id.toString(),
      'qr_hang_hoa': searchTerm
    };

    final response = await http.post(uri.replace(queryParameters: params),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Thành công!');
      await player.play();
      await player.pause();
    } else {
      player.stop();
      throw Exception(response.body);
    }
  }

  Future<int> getIdAddProduct() async {
    SaveLocal saveLocal = SaveLocal();
    var token = await saveLocal.readDataToLocal('token');
    int id = 0;
    final response = await http.get(Uri.parse(GET_ID_ADD_PRODUCT),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      id = json.decode(response.body)['data']['id'];
      return id;
    } else {
      return id;
    }
  }
}
