/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:17:19
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-10 23:56:30
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/goods/product_details/controller.dart
 * @Description: 
 */
import 'package:flutter_woo_commerce_getx_learn/common/api/product.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  ProductDetailsController();

  

  @override
  void onInit() {
    super.onInit();
    
  }

  _initData() async {
    

    update(["product_details"]);
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
