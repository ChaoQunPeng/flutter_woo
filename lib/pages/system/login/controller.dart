/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 16:33:16
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-07 23:54:44
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/system/login/controller.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class LoginController extends GetxController {
  LoginController();

  final state = LoginState();

  /// 定义输入控制器
  TextEditingController userNameController =
      TextEditingController(text: "ducafecat5");
  TextEditingController passwordController =
      TextEditingController(text: "123456");

  /// 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  // tap
  void onTap(int index) {
    state.title = '点击了第$index个按钮';
  }

  /// Sign In
  Future<void> onSignIn() async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();

        // api 请求
        UserTokenModel res = await UserApi.login(UserLoginReq(
          username: userNameController.text,
          password: passwordController.text,
        ));

        // 本地保存 token
        await UserService.to.setToken(res.token!);
        // 获取用户资料
        await UserService.to.getProfile();

        Loading.success();
        Get.back(result: true);
      } finally {
        Loading.dismiss();
      }
    }
  }

  /// Sign Up
  void onSignUp() {
    Get.offNamed(RouteNames.systemRegister);
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  /// 释放
  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
