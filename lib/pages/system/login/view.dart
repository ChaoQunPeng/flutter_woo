/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 16:33:16
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-01 17:22:58
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/system/login/view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
      child: Column(
        children: [
          const HelloWidget(),
          ElevatedButton(
            onPressed: () {
              controller.onTap(DateTime.now().microsecondsSinceEpoch);
            },
            child: const Text("点击"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/splash");
            },
            child: const Text("splash"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
          appBar:
              AppBar(backgroundColor: Colors.blue, title: const Text("login")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
