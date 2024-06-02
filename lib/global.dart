/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 19:17:55
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-02 13:03:18
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/global.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/index.dart';

class Global {
  static Future<void> init() async {
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
