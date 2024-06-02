/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 17:13:39
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-01 21:54:43
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/system/splash/view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/config.dart';
import 'package:get/get.dart';

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);


  // 主视图
  Widget _buildView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // 文字标题
        GetBuilder<SplashController>(
          id: "splash_title1",
          builder: (_) {
            return Center(
              child: Text("SplashPage - ${ConfigService.to.version}"),
            );
          },
        ),

        // 按钮
        ElevatedButton(
          onPressed: () {
            controller.onTap(DateTime.now().microsecondsSinceEpoch);
          },
          child: const Text("立刻点击"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "splash",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("splash")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
