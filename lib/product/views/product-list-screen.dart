// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ictu_mall_manager/product/controller/product-controller.dart';

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
    return Scaffold();
  }
}
