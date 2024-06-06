/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:16:11
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-05 17:03:08
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/system/welcome/controller.dart
 * @Description: 
 */
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();

  List<WelcomeModel>? items;

  int currentIndex = 0;

  bool isShowStart = false; // 是否显示 Start
  CarouselController carouselController = CarouselController(); // slider 控制器

  void onPageChanged(int index) {
    currentIndex = index;
    isShowStart = currentIndex == 2;
    update(['slider', 'bar']);
  }

  // 去首页
  void onToMain() {
    Get.offAllNamed(RouteNames.systemMain);
  }

  // 下一个
  void onNext() {
    carouselController.nextPage();
  }

  _initData() {
    items = [
      WelcomeModel(
        image: AssetsImages.welcome_1Png,
        title: LocaleKeys.welcomeOneTitle.tr,
        desc: LocaleKeys.welcomeOneDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_2Png,
        title: LocaleKeys.welcomeTwoTitle.tr,
        desc: LocaleKeys.welcomeTwoDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_3Png,
        title: LocaleKeys.welcomeThreeTitle.tr,
        desc: LocaleKeys.welcomeThreeDesc.tr,
      ),
    ];
    update(["welcome"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();

    ConfigService.to.setAlreadyOpen();

    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
