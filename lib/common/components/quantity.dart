/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-13 11:23:18
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-13 11:23:29
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/components/quantity.dart
 * @Description: 
 */
import 'package:flutter/cupertino.dart';

import '../index.dart';

/// 数量编辑
class QuantityWidget extends StatelessWidget {
  // 数量发送改变
  final Function(int quantity) onChange;
  // 数量
  final int quantity;
  // 尺寸
  final double? size;
  // 文字尺寸
  final double? fontSize;
  // padding 水平距离
  final double? paddingHorizontal;
  // 颜色
  final Color? color;

  QuantityWidget({
    Key? key,
    required this.quantity,
    required this.onChange,
    this.size,
    this.fontSize,
    this.paddingHorizontal,
    Color? color,
  })  : color = color ?? AppColors.onSurfaceVariant,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 减号
      ButtonWidget.icon(
        Icon(
          CupertinoIcons.minus,
          size: fontSize ?? 14,
          color: color,
        ),
        onTap: () => onChange(quantity - 1 < 0 ? 0 : quantity - 1),
      ),

      // 数量
      TextWidget.body2(
        "$quantity",
        color: color,
      )
          .center()
          .tight(width: size ?? 24, height: size ?? 24)
          .decorated(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: color!, width: 1),
          )
          .paddingHorizontal(paddingHorizontal ?? AppSpace.iconTextSmail),

      // 加号
      ButtonWidget.icon(
        Icon(
          CupertinoIcons.plus,
          size: fontSize ?? 14,
          color: AppColors.highlight,
        ),
        onTap: () => onChange(quantity + 1),
      ),
    ].toRow();
  }
}