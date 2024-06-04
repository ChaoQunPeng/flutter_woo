/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 17:48:51
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-04 14:14:32
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/styles/style_index/view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class StyleIndexPage extends GetView<StyleIndexController> {
  const StyleIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Column(children: [
      // Input 输入框
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesInputs),
        title: const TextWidget.body1("Input 输入框"),
      ),
      // Button 按钮
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesButtons),
        title: const TextWidget.body1("Button 按钮"),
      ),
      // 图片
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesImage),
        title: const TextWidget.body1("Image 图片"),
      ),
      // 文本
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesText),
        title: const Text("Text 文本"),
      ),
      ListTile(
        onTap: controller.onThemeSelected,
        title: Text("主题:${ConfigService.to.isDarkModel ? "Dark" : "Light"}"),
      ),
      ListTile(
        onTap: controller.onLanguageSelected,
        title: Text(
          "语言 : ${ConfigService.to.locale.toLanguageTag()}",
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StyleIndexController>(
      init: StyleIndexController(),
      id: "style_index",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("style_index")),
          appBar: AppBar(
            title: Text(LocaleKeys.stylesTitle.tr),
            titleTextStyle: const TextStyle(color: Colors.white),
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
