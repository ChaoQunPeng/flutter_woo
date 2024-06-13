/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:18:33
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-13 14:58:28
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/my/order_details/controller.dart
 * @Description: 
 */
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  OrderDetailsController();

  // 订单详情
  final OrderModel order = Get.arguments as OrderModel;

  _initData() {
    update(["order_details"]);
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
