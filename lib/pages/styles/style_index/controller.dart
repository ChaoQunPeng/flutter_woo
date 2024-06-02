/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 17:48:51
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-02 11:40:15
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/styles/style_index/controller.dart
 * @Description: 
 */
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class StyleIndexController extends GetxController {
  StyleIndexController();

  // 多语言
  onLanguageSelected() {
    var en = Translation.supportedLocales[0];
    var zh = Translation.supportedLocales[1];

    print(ConfigService.to.locale.toLanguageTag());
    print(en.toLanguageTag());

    ConfigService.to.onLocaleUpdate(
        ConfigService.to.locale.toLanguageTag() == en.toLanguageTag()
            ? zh
            : en);
    update(["styles_index"]);
  }

  _initData() {
    update(["style_index"]);
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
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
