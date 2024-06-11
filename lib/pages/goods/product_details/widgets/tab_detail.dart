/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-11 14:43:04
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-11 14:43:12
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/goods/product_details/widgets/tab_detail.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 商品详情
class TabDetailView extends GetView<ProductDetailsController> {
  final String uniqueTag;

  const TabDetailView({Key? key, required this.uniqueTag}) : super(key: key);

  @override
  String? get tag => uniqueTag;

  @override
  Widget build(BuildContext context) {
    return const Text("商品详情");
  }
}