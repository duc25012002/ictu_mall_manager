// ignore_for_file: file_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ictu_mall_manager/sell/controller/sell-controller.dart';
import 'package:ictu_mall_manager/utils/text-widget.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  SellController? sellController = SellController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          onTap: () async {
            print('Barcode data: ');
            while (true) {
              String barcode = await FlutterBarcodeScanner.scanBarcode(
                '#ff6666',
                'Thoát',
                true,
                ScanMode.BARCODE,
              );
              if (barcode != null) {
                await sellController!.fetchData(barcode);
              } else {
                Fluttertoast.showToast(msg: 'Không tìm thấy sản phẩm');
              }
            }
          },
          child: Center(
            child: TextWidget(text: 'Bắt đầu quét', size: 20),
          ),
        ),
      ),
    );
  }
}
