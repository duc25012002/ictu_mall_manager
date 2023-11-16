// ignore_for_file: file_names, unnecessary_null_comparison, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:ictu_mall_manager/controllers/history-controller.dart';
import 'package:ictu_mall_manager/controllers/product-controller.dart';
import 'package:ictu_mall_manager/utils/text-widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  ProductController productController = ProductController();
  HistoryController historyController = HistoryController();
  @override
  void initState() {
    super.initState();
    productController.getListProduct();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: historyController.getDataHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final historyList = snapshot.data;
          return Scaffold(
            backgroundColor: Colors.grey.withOpacity(.2),
            body: Column(
              children: [
                const SizedBox(height: 50),
                TextWidget(
                    text: 'Lịch sử bán hàng',
                    size: 20,
                    fontWeight: FontWeight.w500),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 1.5,
                  child: ListView.separated(
                    itemCount: historyList!.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      color: Colors.black45,
                    ),
                    itemBuilder: (context, index) {
                      final history = historyList[index];
                      return ListTile(
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  history.hangHoa!.img != null
                                      ? history.hangHoa!.img
                                      : 'https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg',
                                  width: 80,
                                  height: 80,
                                  errorBuilder:
                                      (context, exception, stackTrace) {
                                    return const Text('Your error widget...');
                                  },
                                ),
                                const SizedBox(width: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                        text:
                                            'Tên hàng hoá: ${history.hangHoa!.tenHangHoa}'
                                                .trim(),
                                        size: 13,
                                        color: Colors.black),
                                    TextWidget(
                                        text:
                                            'Giá bán: ${history.hangHoa!.giaBan}'
                                                .trim(),
                                        size: 13,
                                        color: Colors.black),
                                    TextWidget(
                                        text:
                                            'Barcode: ${history.hangHoa!.barcode}'
                                                .trim(),
                                        size: 13,
                                        color: Colors.black),
                                    TextWidget(
                                      text:
                                          'Đơn vị tính: ${history.hangHoa!.donViTinh}'
                                              .trim(),
                                      size: 13,
                                      color: Colors.black,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}
