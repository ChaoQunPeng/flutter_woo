/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-05 15:01:36
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-05 16:18:53
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/components/slider_indicator.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

/// slider indicator 指示器
class SliderIndicatorWidget extends StatelessWidget {
  /// 个数
  final int length;

  /// 当前位置
  final int currentIndex;

  /// 颜色
  final Color color;

  /// 是否原型
  final bool isCircle;

  /// 对齐方式
  final MainAxisAlignment alignment;

  SliderIndicatorWidget({
    Key? key,
    required this.length,
    required this.currentIndex,
    Color? color,
    this.isCircle = false,
    this.alignment = MainAxisAlignment.center,
  })  : color = color ?? AppColors.primary,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        // 采用 list.generate 方式生成 item 项
        ...List.generate(length, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            // 圆型宽度 6 , 否则当前位置 15 , 其他位置 8
            width: !isCircle
                ? currentIndex == index
                    ? 15.0
                    : 8
                : 6,
            // 圆型高度 6 , 否则 4
            height: !isCircle ? 4 : 6,
            decoration: BoxDecoration(
              // 圆角 4
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              // 非当前位置透明度 0.3
              color: currentIndex == index ? color : color.withOpacity(0.3),
            ),
          );
        }),
      ].toList(),
    );
  }
}
