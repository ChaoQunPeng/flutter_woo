/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-02 13:46:32
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-02 15:08:56
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/style/theme.dart
 * @Description: 
 */
import 'package:flutter/material.dart';

import 'index.dart';

/// 主题
class AppTheme {
  /// 亮色
  static ThemeData light = ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: false,
    fontFamily: "Montserrat",
  );

  /// 暗色
  static ThemeData dark = ThemeData(
    colorScheme: darkColorScheme,
    useMaterial3: false,
    fontFamily: "Montserrat",
  );
}
