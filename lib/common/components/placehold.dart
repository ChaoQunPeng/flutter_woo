/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-10 17:30:53
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-10 17:31:01
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/components/placehold.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';


/// 占位图组件
class PlaceholdWidget extends StatelessWidget {
  // 资源图片地址
  final String? assetImagePath;

  const PlaceholdWidget({
    Key? key,
    this.assetImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageWidget.asset(assetImagePath ?? AssetsImages.homePlaceholderPng)
        .paddingHorizontal(AppSpace.page)
        .center();
  }
}