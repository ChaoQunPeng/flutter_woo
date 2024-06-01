/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 16:33:16
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-01 16:59:45
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/system/login/controller.dart
 * @Description: 
 */
import 'package:get/get.dart';

import 'index.dart';

class LoginController extends GetxController {
  LoginController();

  final state = LoginState();

  // tap
  void onTap(int index) {
    state.title = '点击了第$index个按钮';
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
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
