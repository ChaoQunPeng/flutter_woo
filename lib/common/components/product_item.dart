/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-10 15:10:33
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-10 15:34:02
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/components/product_item.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 商品展示项
class ProductItemWidget extends StatelessWidget {
  /// 点击事件
  final Function()? onTap;

  /// 商品数据模型
  final ProductModel product;

  /// 图片宽
  final double? imgWidth;

  /// 图片高
  final double? imgHeight;

  const ProductItemWidget(
    this.product, {
    Key? key,
    this.onTap,
    this.imgWidth,
    this.imgHeight,
  }) : super(key: key);

  Widget _buildView(BoxConstraints constraints) {
    var ws = <Widget>[
      // 图片
      if (product.images?.isNotEmpty == true)
        ImageWidget.url(
          product.images?.first.src ?? "",
          fit: BoxFit.cover,
          width: imgWidth ?? constraints.minWidth,
          height: imgHeight,
        ),
      // 描述
      <Widget>[
        // 标题
        TextWidget.body2(product.name ?? ""),

        // 价格
        if (product.price != null)
          TextWidget.body2(
            product.price ?? "",
            weight: FontWeight.bold,
          )
        else
          TextWidget.body2(
            "暂无价格",
            color: AppColors.onPrimary,
          ),
      ]
          .toColumn(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .paddingHorizontal(5)
          .expanded(),
    ];

    return ws
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        // .backgroundColor(AppColors.onPrimary)
        .card(
          blurRadius: 5,
        )
        .padding(all: 5)
        .onTap(() {
      if (onTap != null) {
        onTap?.call();
      } else {
        Get.toNamed(
          RouteNames.goodsProductDetails,
          arguments: {
            "id": product.id,
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return _buildView(constraints);
      },
    );
  }
}
