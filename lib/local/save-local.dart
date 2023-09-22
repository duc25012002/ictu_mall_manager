// ignore_for_file: file_names

import 'package:get_storage/get_storage.dart';

class SaveLocal {
  final box = GetStorage();

  Future<void> writeDataToLocal(String key, String data) async {
    box.write(key, data);
    print('Save data successfully');
  }

  Future<String?> readDataToLocal(String key) async {
    print('Save data successfully');
    String data = box.read(key);
    return data;
  }
}
