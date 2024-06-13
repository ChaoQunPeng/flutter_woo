/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-13 15:55:30
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-13 15:58:11
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/my/order_details/widgets/total_item.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

/// 小计项
class BuildTotalItem extends StatelessWidget {
  const BuildTotalItem({
    Key? key,
    this.title,
    this.price,
    this.currencySymbol,
  }) : super(key: key);

  /// 标题
  final String? title;

  /// 价格
  final String? price;

  /// 货币符号
  final String? currencySymbol;

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // title
      TextWidget.body1(title ?? "").expanded(),

      // price
      TextWidget.body2("$currencySymbol $price"),
    ].toRow();
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}