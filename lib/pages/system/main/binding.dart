/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-08 10:56:18
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-08 12:29:17
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/system/main/binding.dart
 * @Description: 
 */
import 'package:flutter_woo_commerce_getx_learn/pages/index.dart';
import 'package:get/get.dart';

/// 主界面依赖
class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CartIndexController>(() => CartIndexController());
    // Get.lazyPut<MsgIndexController>(() => MsgIndexController());
    Get.lazyPut<MyIndexController>(() => MyIndexController());
    Get.lazyPut<MainController>(() => MainController());
  }
}
