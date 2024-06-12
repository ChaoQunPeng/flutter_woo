/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:18:03
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-12 17:36:07
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/my/my_index/controller.dart
 * @Description: 
 */
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/system/main/index.dart';
import 'package:get/get.dart';

class MyIndexController extends GetxController {
  MyIndexController();

  _initData() {
    print(Storage().getString(Constants.storageToken));
    update(["my_index"]);
  }

  void onTap() {}

  // 注销
  void onLogout() {
    UserService.to.logout();
    Get.find<MainController>().onJumpToPage(0);
  }

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
