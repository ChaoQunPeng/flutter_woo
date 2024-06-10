/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:16:55
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-10 09:38:49
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/goods/home/controller.dart
 * @Description: 
 */
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  _initData() {
    update(["home"]);
  }

  void onTap() {}

  // 导航点击事件
  void onAppBarTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
