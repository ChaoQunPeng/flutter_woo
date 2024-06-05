/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 17:13:39
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-06 00:02:18
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/system/splash/controller.dart
 * @Description: 
 */
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  _initData() {
    update(["splash"]);
  }

  String title = "";

  void onTap(int ticket) {
    title = "GetBuilder -> 点击了第 $ticket 个按钮";
    update(['splash_title1']);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  _jumpToPage() async {
    Get.offAllNamed(RouteNames.main);
    // if (ConfigService.to.isFirstOpen) {
    //   Get.offAllNamed(RouteNames.systemMain);
    // } else {
    //   // 欢迎页
    //   // await Future.delayed(const Duration(seconds: 2));
    //   Get.offAllNamed(RouteNames.systemWelcome);
    // }
  }

  @override
  void onReady() {
    super.onReady();
    // 删除设备启动图
    FlutterNativeSplash.remove();

    _jumpToPage();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
