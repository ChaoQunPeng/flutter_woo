/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 17:52:02
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-12 17:05:55
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/system/main/controller.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController();

  // 分页管理
  final PageController pageController = PageController();

  // 当前的 tab index
  int currentIndex = 0;

  // 导航栏切换
  void onIndexChanged(int index) {
    currentIndex = index;
    update(['navigation']);
  }

  // 切换页面
  void onJumpToPage(int page) {
    if ((page != 0) && !UserService.to.isLogin) {
      Get.toNamed(RouteNames.systemLogin);
    } else {
      pageController.jumpToPage(page);
    }
  }

  _initData() async {
    // 读取用户 profile
    await UserService.to.getProfile();

    // 测试用
    // Get.toNamed(RouteNames.systemLogin);

    update(["main"]);
  }

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    // 释放页控制器
    pageController.dispose();
  }
}
