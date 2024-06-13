/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:19:16
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-13 11:33:35
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/cart/buy_now/controller.dart
 * @Description: 
 */
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class BuyNowController extends GetxController {
  BuyNowController(this.product);

  // 商品详情
  final ProductModel product;

  // 支付方式图标
  List<String> paymentList = [
    AssetsImages.pVisaPng,
    AssetsImages.pCashPng,
    AssetsImages.pMastercardPng,
    AssetsImages.pPaypalPng,
  ];

  // 下单 checkout
  void onCheckout() async {}

  _initData() {
    update(["buy_now"]);
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
