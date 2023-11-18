// ignore_for_file: file_names, unnecessary_null_comparison, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:ictu_mall_manager/controllers/product-controller.dart';
import 'package:ictu_mall_manager/utils/text-widget.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductController productController = ProductController();
  @override
  void initState() {
    super.initState();
    productController.getListProduct();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productController.getListProduct(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final productList = snapshot.data;
          return Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 50),
                TextWidget(
                    text: 'Danh sách hàng hoá',
                    size: 20,
                    fontWeight: FontWeight.w500),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 1.5,
                  child: ListView.separated(
                    itemCount: productList!.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      color: Colors.black45,
                    ),
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      return ListTile(
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  product.img != null
                                      ? product.img
                                      : 'https://key-comic-starling.ngrok-free.app/storage/images/hanghoa/1695269928.png',
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
                                            'Tên hàng hoá: ${product.tenHangHoa}'
                                                .trim(),
                                        size: 13,
                                        color: Colors.black),
                                    TextWidget(
                                        text:
                                            'Giá bán: ${product.giaBan}'.trim(),
                                        size: 13,
                                        color: Colors.black),
                                    TextWidget(
                                        text: 'Barcode: ${product.barcode}'
                                            .trim(),
                                        size: 13,
                                        color: Colors.black),
                                    TextWidget(
                                      text: 'Đơn vị tính: ${product.donViTinh}'
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
