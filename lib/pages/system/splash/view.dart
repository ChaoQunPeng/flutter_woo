/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 17:13:39
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-05 11:07:41
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/system/splash/view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
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
            return const ImageWidget.asset(
              AssetsImages.splashJpg,
              fit: BoxFit.fill, // 填充整个界面
            );
          },
        ),

        // 按钮
        // ElevatedButton(
        //   onPressed: () {
        //     Get.offAllNamed(RouteNames.stylesStyleIndex);
        //     // controller.onTap(DateTime.now().microsecondsSinceEpoch);
        //   },
        //   child: const Text("回到style_index页面"),
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "splash",
      builder: (_) {
        return _buildView();
      },
    );
  }
}
