/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-02 13:46:32
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-10 09:40:50
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/style/theme.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'index.dart';

/// 主题
class AppTheme {
  /// 亮色
  static ThemeData light = ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: false,
    fontFamily: "Montserrat",
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light, // 相反appBar 亮色 , 和主题色相反
      // backgroundColor: Colors.black
    ),
  );

  /// 暗色
  static ThemeData dark = ThemeData(
    colorScheme: darkColorScheme,
    useMaterial3: false,
    fontFamily: "Montserrat",
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark, // appBar 暗色 , 和主题色
      // backgroundColor: Colors.black
    ),
  );
}
