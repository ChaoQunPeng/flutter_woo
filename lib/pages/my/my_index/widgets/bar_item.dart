/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-12 17:06:21
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-12 17:06:30
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/my/my_index/widgets/bar_item.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

/// 功能栏项
class BarItemWidget extends StatelessWidget {
  final String title;
  final String svgPath;

  const BarItemWidget({
    Key? key,
    required this.title,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 图标
      IconWidget.svg(
        svgPath,
        size: 24.sp,
        color: AppColors.primary,
      ).paddingBottom(AppSpace.iconTextSmail),

      // 标题
      TextWidget.body2(
        title,
      ),
    ].toColumn();
  }
}