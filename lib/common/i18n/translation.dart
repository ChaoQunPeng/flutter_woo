/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-02 10:47:00
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-02 10:49:39
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/i18n/translation.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'index.dart';


/// 翻译类
class Translation extends Translations {
  // 当前系统语言
  // static Locale? get locale => Get.deviceLocale;
  
  // 默认语言 Locale(语言代码, 国家代码)
  static const fallbackLocale = Locale('en', 'US');

  // 支持语言列表
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
  ];

  // 代理
  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  // 语言代码对应的翻译文本
  @override
  Map<String, Map<String, String>> get keys => {
        'en': localeEn,
        'zh': localeZh,
      };
}