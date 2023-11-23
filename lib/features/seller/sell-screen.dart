// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: file_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/features/seller/sell-controller.dart';
import 'package:ictu_mall_manager/utils/text-widget.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  SellController? sellController = SellController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: SizeConfig.height! * 0.1,
              child: Container(
                width: SizeConfig.width! - 25,
                height: SizeConfig.height! * 0.2,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      offset: Offset(0.5, 0.5),
                      blurRadius: 5.5,
                    ),
                  ],
                ),
                child: InkWell(
                  // onTap: () async {
                  //   while (true) {
                  //     String barcode = await FlutterBarcodeScanner.scanBarcode(
                  //       '#ff6666',
                  //       'Thoát',
                  //       true,
                  //       ScanMode.BARCODE,
                  //     );
                  //     if (barcode != null) {
                  //       await sellController!.fetchData(barcode);
                  //     } else {
                  //       Fluttertoast.showToast(msg: 'Không tìm thấy sản phẩm');
                  //     }
                  //   }
                  // },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_business,
                        size: 60,
                        color: Colors.white,
                      ),
                      TextWidget(
                        text: 'Nhập hàng',
                        size: SizeConfig.titlePx!,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.height! * 0.4,
              child: Container(
                width: SizeConfig.width! - 25,
                height: SizeConfig.height! * 0.2,
                decoration: BoxDecoration(
                  color: Colors.red.shade300,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      offset: Offset(0.5, 0.5),
                      blurRadius: 5.5,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () async {
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.attach_money_outlined,
                        size: 60,
                        color: Colors.white,
                      ),
                      TextWidget(
                        text: 'Bán hàng',
                        size: SizeConfig.titlePx!,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
