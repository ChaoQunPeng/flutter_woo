/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:17:40
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-12 14:35:16
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/search/search_index/view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class SearchIndexPage extends GetView<SearchIndexController> {
  const SearchIndexPage({Key? key}) : super(key: key);

  // 导航栏
  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: AppSpace.listItem,
      // 搜索栏
      title: InputWidget.textBorder(
        controller: controller.searchEditController,
        hintText: "You can try T-Shirt", //LocaleKeys.commonSearchInput.tr,
        onChanged: (val) {
          printInfo(info: val);
        },
      ).paddingRight(AppSpace.page),
    );
  }

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("SearchIndexPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchIndexController>(
      init: SearchIndexController(),
      id: "search_index",
      builder: (_) {
        return Scaffold(
          // 搜索栏
          appBar: _buildAppBar(),
          // 内容
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
