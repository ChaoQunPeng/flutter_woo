/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 17:52:02
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-08 09:18:42
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/system/main/controller.dart
 * @Description: 
 */
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController();

  _initData() async {
    // 读取用户 profile
    await UserService.to.getProfile();

    // 测试用
    Get.toNamed(RouteNames.systemLogin);

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

    Get.toNamed(RouteNames.stylesStyleIndex);
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
