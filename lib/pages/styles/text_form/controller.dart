/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:13:44
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-05 22:49:27
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/styles/text_form/controller.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormController extends GetxController {
  TextFormController();

  GlobalKey formKey = GlobalKey<FormState>();

  TextEditingController unameController =
      TextEditingController(text: "ducafecat");

  TextEditingController pwdController = TextEditingController(text: "123456");

  _initData() {
    update(["text_form"]);
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
    unameController.dispose();
    pwdController.dispose();
  }
}
