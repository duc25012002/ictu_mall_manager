// ignore_for_file: file_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:ictu_mall_manager/product/controller/product-controller.dart';
import 'package:ictu_mall_manager/product/model/product.dart';
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
    return FutureBuilder<List<Product>>(
      future: productController.getListProduct(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final productList = snapshot.data;
          return SafeArea(
            child: Column(
              children: [
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
                                        ? 'https://intent-woodcock-needed.ngrok-free.app/storage/images/hanghoa/1680776320.png'
                                        : product.img,
                                    width: 80,
                                    height: 80),
                                const SizedBox(width: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                        text:
                                            'Tên hàng hoá: ${product.tenHangHoa}',
                                        size: 13,
                                        color: Colors.black),
                                    TextWidget(
                                        text: 'Mô tả: ${product.moTa}',
                                        size: 13,
                                        color: Colors.black),
                                    TextWidget(
                                        text: 'Giá bán: ${product.giaBan}',
                                        size: 13,
                                        color: Colors.black),
                                    TextWidget(
                                        text: 'Barcode: ${product.barcode}',
                                        size: 13,
                                        color: Colors.black),
                                    TextWidget(
                                        text:
                                            'Đơn vị tính: ${product.donViTinh}',
                                        size: 13,
                                        color: Colors.black),
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
