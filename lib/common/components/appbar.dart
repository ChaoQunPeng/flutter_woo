/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-10 22:59:20
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-10 23:29:38
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/components/appbar.dart
 * @Description: 
 */
import 'package:flutter/material.dart';

import '../index.dart';

/// 主导航栏
AppBar mainAppBarWidget({
  Key? key,
  Function()? onTap, // 点击事件
  Widget? leading, // 左侧按钮
  String? hintText, // 输入框默认提示文字
  // 标题
  String? titleString, // 标题
  double? titleSpace, // 标题间距
  double? iconSize, // 图标大小
}) {
  const double span = 20;

  return AppBar(
    leading: leading,
    titleSpacing: titleSpace ?? 0,
    title: hintText != null
        ? InputWidget.textBorder(
            hintText: hintText,
            readOnly: true,
            onTap: onTap,
          )
        : Text(titleString ?? ""),
    actions: [
      // 搜索
      IconWidget.svg(
        AssetsSvgs.iSearchSvg,
        size: iconSize ?? 20,
      ).paddingRight(span),

      // 消息
      IconWidget.svg(
        AssetsSvgs.iNotificationsSvg,
        size: iconSize ?? 20,
        isDot: true,
      ).unconstrained().paddingRight(span),

      // 更多
      IconWidget.svg(
        AssetsSvgs.iIndicatorsSvg,
        size: iconSize ?? 20,
      ).paddingRight(span),
    ],
  );
}
