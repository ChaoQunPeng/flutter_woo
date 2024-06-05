/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-06 00:11:01
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-06 00:16:08
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/system/register/controller.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController();

  // final state = RegisterState();

  // 用户名
  TextEditingController userNameController =
      TextEditingController(text: "ducafecat5");
  // 邮件
  TextEditingController emailController =
      TextEditingController(text: "ducafecat5@gmail.com");
  // 姓
  TextEditingController firstNameController =
      TextEditingController(text: "ducafe");
  // 名
  TextEditingController lastNameController = TextEditingController(text: "cat");
  // 密码
  TextEditingController passwordController =
      TextEditingController(text: "12345678");

  _initData() {
    update(["register"]);
  }

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  void onTap() {}

  // 注册
  void onSignUp() {}

  // 登录
  void onSignIn() {}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // 释放
  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
