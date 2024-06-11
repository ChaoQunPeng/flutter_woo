/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-11 14:46:28
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-11 14:46:36
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/goods/product_details/widgets/tab_reviews.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 评论
class TabReviewsView extends GetView<ProductDetailsController> {
  final String uniqueTag;

  const TabReviewsView({Key? key, required this.uniqueTag}) : super(key: key);

  @override
  String? get tag => uniqueTag;

  @override
  Widget build(BuildContext context) {
    return const Text("评论");
  }
}