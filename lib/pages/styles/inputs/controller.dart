/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:13:50
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-13 10:40:49
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/styles/inputs/controller.dart
 * @Description: 
 */
import 'package:get/get.dart';

class InputsController extends GetxController {
  InputsController();

  _initData() {
    update(["inputs"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  bool checkVal = true;
  void onCheckBox(bool val) {
    checkVal = val;
    update(["inputs"]);
  }

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
