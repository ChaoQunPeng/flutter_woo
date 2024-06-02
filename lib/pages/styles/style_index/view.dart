/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 17:48:51
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-02 14:59:49
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
