/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 19:17:55
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-05 11:26:42
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/global.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'common/index.dart';

class Global {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    
    // 初始化原生应用相关的东西
    WidgetsFlutterBinding.ensureInitialized();

    // Get.put<ConfigService>(ConfigService());

    // 工具类
    await Storage().init();
    
    await Future.wait([
      Get.putAsync<ConfigService>(() async => await ConfigService().init()),
    ]).whenComplete(() {});

    Get.put<WPHttpService>(WPHttpService());
  }
}
