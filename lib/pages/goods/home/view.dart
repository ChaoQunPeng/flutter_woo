/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:16:55
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-11 13:41:14
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/goods/home/view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';
import 'widgets/list_title.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // 导航栏
  AppBar _buildAppBar() {
    return AppBar(
      // 背景透明
      backgroundColor: Colors.transparent,
      // 取消阴影
      elevation: 0,
      // 标题栏左侧间距
      titleSpacing: AppSpace.listItem,
      // 搜索栏
      title: InputWidget.search(
        // 提示文字，多语言
        hintText: LocaleKeys.gHomeNewProduct.tr,
        // 点击事件
        onTap: controller.onAppBarTap,
        // 只读
        readOnly: true,
      ),
      // 右侧的按钮区
      actions: [
        // 图标
        IconWidget.svg(
          AssetsSvgs.pNotificationsSvg,
          size: 20,
          isDot: true, // 未读消息 小圆点
        )
            .unconstrained() // 去掉约束, appBar 会有个约束下来
            .padding(
              left: AppSpace.listItem,
              right: AppSpace.page,
            ),
      ],
    );
  }

  // 轮播广告
  Widget _buildBanner() {
    return GetBuilder<HomeController>(
            init: controller,
            id: "home_banner",
            builder: (_) {
              return CarouselWidget(
                items: controller.bannerItems,
                currentIndex: controller.bannerCurrentIndex,
                onPageChanged: controller.onChangeBanner,
                height: 190.w,
              );
            })
        .clipRRect(all: AppSpace.button)
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page);
  }

  // 分类导航
  Widget _buildCategories() {
    getCategoryItemList() {
      List<Widget> categoryItemList = [];

      // 链式调用，类型写CategoryListItemWidget
      // for (var i = 0; i < controller.categoryItems.length; i++) {
      //   categoryItemList.add(CategoryListItemWidget(
      //     category: controller.categoryItems[i],
      //     onTap: (categoryId) => controller.onCategoryTap(categoryId),
      //   )..paddingRight(AppSpace.listItem));
      // }

      for (var i = 0; i < controller.categoryItems.length; i++) {
        categoryItemList.add(
          CategoryListItemWidget(
            category: controller.categoryItems[i],
            onTap: (categoryId) => controller.onCategoryTap(categoryId),
          ).paddingRight(AppSpace.listItem),
        );
      }

      return categoryItemList;
    }

    return <Widget>[...getCategoryItemList()]
        .toListView(
          scrollDirection: Axis.horizontal,
        )
        .height(90.w)
        .paddingVertical(AppSpace.listRow)
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page);
  }

  /// 热卖商品
  Widget _buildFlashSell() {
    return <Widget>[
      for (var i = 0; i < controller.flashShellProductList.length; i++)
        ProductItemWidget(
          controller.flashShellProductList[i],
          imgHeight: 117.w,
          imgWidth: 120.w,
        )
            .constrained(
              width: 130.w,
              height: 170.w,
            )
            .paddingRight(AppSpace.listItem)
    ]
        .toListView(
          scrollDirection: Axis.horizontal,
        )
        .height(170.w)
        .paddingBottom(AppSpace.listRow)
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page);
  }

  // New Sell
  // 新商品
  Widget _buildNewSell() {
    return GetBuilder<HomeController>(
      id: "home_news_sell",
      builder: (_) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int position) {
              var product = controller.newProductProductList[position];
              return ProductItemWidget(
                product,
                imgHeight: 170.w,
              );
            },
            childCount: controller.newProductProductList.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: AppSpace.listRow,
            crossAxisSpacing: AppSpace.listItem,
            childAspectRatio: 0.8,
          ),
        )
            .sliverPadding(bottom: AppSpace.page)
            .sliverPaddingHorizontal(AppSpace.page);
      },
    );
  }

  // 主视图
  Widget _buildView() {
    var flag = controller.flashShellProductList.isEmpty ||
        controller.newProductProductList.isEmpty;
    return flag
        ? const PlaceholdWidget()
        : CustomScrollView(
            slivers: [
              // 轮播广告
              _buildBanner(),

              // 分类导航
              _buildCategories(),

              // 热卖商品
              controller.flashShellProductList.isNotEmpty
                  ? BuildListTitle(
                      title: LocaleKeys.gHomeFlashSell.tr,
                      subTitle: "03. 30. 30",
                      onTap: () => controller.onAllTap(
                          true, LocaleKeys.gHomeFlashSell.tr),
                    )
                      .sliverToBoxAdapter()
                      .sliverPaddingHorizontal(AppSpace.page)
                  : const SliverToBoxAdapter(),

              _buildFlashSell(),

              // 推荐商品 栏位标题
              controller.flashShellProductList.isNotEmpty
                  ? BuildListTitle(
                      title: LocaleKeys.gNewsTitle.tr,
                      onTap: () =>
                          controller.onAllTap(true, LocaleKeys.gNewsTitle.tr),
                    )
                      .sliverToBoxAdapter()
                      .sliverPaddingHorizontal(AppSpace.page)
                  : const SliverToBoxAdapter(),

              // list
              _buildNewSell(),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: SmartRefresher(
            controller: controller.refreshController, // 刷新控制器
            enablePullUp: true, // 启用上拉加载
            onRefresh: controller.onRefresh, // 下拉刷新回调
            onLoading: controller.onLoading, // 上拉加载回调
            footer: const SmartRefresherFooterWidget(), // 底部加载更多
            child: _buildView(),
          ),
        );
      },
    );
  }
}
