/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:16:55
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-10 09:58:33
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/goods/home/controller.dart
 * @Description: 
 */
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  // Banner 当前位置
  int bannerCurrentIndex = 0;

  // Banner 数据
  List<KeyValueModel> bannerItems = [];

  // Banner 切换事件
  void onChangeBanner(int index, /*CarouselPageChangedReason*/ reason) {
    bannerCurrentIndex = index;
    update(["home_banner"]);
  }

  _initData() async {
    // 首页
    // banner
    bannerItems = await SystemApi.banners();

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
