/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 17:52:02
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-06 00:02:30
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/system/main/controller.dart
 * @Description: 
 */
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController();

  _initData() {
    update(["main"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();

    Get.toNamed(RouteNames.systemRegister);
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
