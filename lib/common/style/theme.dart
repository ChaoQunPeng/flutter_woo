/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-02 13:46:32
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-10 23:02:10
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
      // appBar 暗色 , 和主题色相反
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      // 背景透明
      backgroundColor: Colors.transparent,
      // 取消阴影
      elevation: 0,
      // 图标样式
      iconTheme: IconThemeData(
        color: Color(0xFF5F84FF),
      ),
      // 标题
      titleTextStyle: TextStyle(
        color: Color(0xFF4D4D4D),
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
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
