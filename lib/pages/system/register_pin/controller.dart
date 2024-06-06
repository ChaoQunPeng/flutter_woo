/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:16:20
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-06 14:45:56
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/system/register_pin/controller.dart
 * @Description: 
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class RegisterPinController extends GetxController {
  RegisterPinController();

  // ping 文字输入控制器
  TextEditingController pinController = TextEditingController();

  // 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  // 注册界面传值
  UserRegisterReq? req = Get.arguments;

  // 验证 pin
  String? pinValidator(val) {
    return val == '111111'
        ? null
        : LocaleKeys.commonMessageIncorrect.trParams({"method": "Pin"});
  }

  // 注册
  Future<void> _register() async {
    try {
      Loading.show();

      // 暂时提交，后续改 aes 加密后处理
      bool isOk = await UserApi.register(req);
      if (isOk) {
        Loading.success(
            LocaleKeys.commonMessageSuccess.trParams({"method": "Register"}));
        Get.back(result: true);
      }

      // 提示成功
      // Loading.success(
      //     LocaleKeys.commonMessageSuccess.trParams({"method": "Register"}));
      // Get.back(result: true);
    } on DioExceptionType catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
    } finally {
      Loading.dismiss();
    }
  }

  // pin 触发提交
  void onPinSubmit(String val) {
    debugPrint("onPinSubmit: $val");
  }

  // 按钮提交
  void onBtnSubmit() {
    print("req");
    print(req!.toJson());
    _register();
  }

  // 按钮返回
  void onBtnBackup() {
    Get.back();
  }

  @override
  void onClose() {
    super.onClose();
    pinController.dispose();
  }
}
