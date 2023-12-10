// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ictu_mall_manager/constant/api.dart';
import 'package:ictu_mall_manager/features/get_list_product/get_list_product_controller.dart';
import 'package:ictu_mall_manager/utils/text_widget.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class GetListProductScreen extends GetView<GetListProductController> {
  const GetListProductScreen({Key? key}) : super(key: key);

  convertTextToVND(String text) {
    int convert = int.parse(text);
    return NumberFormat('#,###').format(convert);
  }

  Future<void> _refresh() async {
    await controller.getListProduct();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Obx(
          () {
            if (controller.getListProduct() == null) {
              return const Center(child: CircularProgressIndicator(color: Colors.blue));
            } else {
              return SafeArea(
                child: controller.productList.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: ListView.separated(
                          itemCount: controller.productList.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(
                            color: Colors.black45,
                          ),
                          itemBuilder: (context, index) {
                            final product = controller.productList[index];
                            return ListTile(
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        product.img,
                                        width: 60,
                                        height: 60,
                                        errorBuilder:
                                            (context, exception, stackTrace) {
                                          return const Text('');
                                        },
                                      ),
                                      const SizedBox(width: 30),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text:
                                                '${product.tenHangHoa}'.trim(),
                                            size: 13,
                                            color: Colors.black,
                                          ),
                                          TextWidget(
                                            text:
                                                'Giá bán: ${convertTextToVND(product.giaBan!)} VNĐ'
                                                    .trim(),
                                            size: 13,
                                            color: Colors.black,
                                          ),
                                          TextWidget(
                                            text: 'Barcode: ${product.barcode}'
                                                .trim(),
                                            size: 13,
                                            color: Colors.black,
                                          ),
                                          TextWidget(
                                            text:
                                                'Đơn vị tính: ${product.donViTinh}'
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
                      )
                    : Center(child: Lottie.asset('assets/images/loading.json')),
              );
            }
          },
        ),
      ),
    );
  }
}
