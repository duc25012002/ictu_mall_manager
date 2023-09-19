import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String barcode = await FlutterBarcodeScanner.scanBarcode(
              '#ff6666', // Màu của nút quét
              'Cancel', // Văn bản nút hủy bỏ
              false, // Ẩn nút hủy bỏ
              ScanMode.BARCODE, // Chế độ quét (mã vạch)
            );
            print('Barcode data: $barcode');
            // Xử lý dữ liệu mã vạch ở đây
          },
          child: Text('Start Scanning'),
        ),
      ),
    );
  }
}
