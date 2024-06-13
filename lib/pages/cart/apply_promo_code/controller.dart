/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:19:29
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-13 12:41:14
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/cart/apply_promo_code/controller.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplyPromoCodeController extends GetxController {
  ApplyPromoCodeController();

  // 优惠券控制器
  TextEditingController couponController = TextEditingController();

  _initData() {
    update(["apply_promo_code"]);
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

  @override
  void onClose() {
    super.onClose();
    couponController.dispose();
  }
}
