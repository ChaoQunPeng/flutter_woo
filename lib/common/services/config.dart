/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 19:11:38
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-02 11:57:08
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/services/config.dart
 * @Description: 
 */
import 'dart:ui';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../index.dart';

/// 配置服务
class ConfigService extends GetxService {
  // 这是一个单例写法
  static ConfigService get to => Get.find();

  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

  Locale locale = PlatformDispatcher.instance.locale;

  @override
  void onReady() {
    super.onReady();
    initLocale();
  }

  // 初始化
  Future<ConfigService> init() async {
    await getPlatform();
    return this;
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // 初始语言
  void initLocale() {
    var langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) return;
    var index = Translation.supportedLocales.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = Translation.supportedLocales[index];
  }

  // 更改语言
  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }
}
