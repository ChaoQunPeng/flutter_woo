/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:17:45
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-12 16:01:30
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/search/search_filter/view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/filter_view.dart';

class SearchFilterPage extends GetView<SearchFilterController> {
  const SearchFilterPage({Key? key}) : super(key: key);

// 搜索过滤栏
  Widget _buildFilterBar() {
    return <Widget>[
      // 排序 Best Match
      DropdownWidget(
        items: controller.orderList,
        hintText: controller.orderSelected.value,
        onChanged: controller.onOrderTap,
      )
          .decorated(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          )
          .height(40.h)
          .expanded(),

      // 筛选 Filter
      ButtonWidget.dropdown(
        LocaleKeys.searchFilter.tr,
        IconWidget.icon(
          Icons.expand_more,
          color: AppColors.primary,
        ),
        onTap: controller.onFilterOpenTap,
        textSize: 15,
        textColor: AppColors.secondary,
        textWeight: FontWeight.w400,
        borderColor: AppColors.surfaceVariant,
        height: 40.h,
      ).expanded(),
    ].toRow();
  }

  // 数据列表
  Widget _buildListView() {
    return Text("数据列表");
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 筛选栏
      _buildFilterBar(),
      // 数据列表
      _buildListView(),
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchFilterController>(
      init: SearchFilterController(),
      id: "search_filter",
      builder: (_) {
        return Scaffold(
          // key
          key: controller.scaffoldKey,
          // 导航
          appBar: mainAppBarWidget(
            titleSpace: 20,
            // 返回按钮
            leading: ButtonWidget.icon(
              IconWidget.icon(
                Icons.arrow_back,
                color: AppColors.primary,
              ),
              onTap: () => Get.back(),
            ),
            // 输入文字
            hintText: LocaleKeys.searchPlaceholder.tr,
            // 点击事件
            onTap: () => Get.back(),
          ),

          // 内容
          body: _buildView(),

          // 右侧弹出 Drawer
          endDrawer: const Drawer(
            child: SafeArea(child: FilterView()),
          ),
        );
      },
    );
  }
}
