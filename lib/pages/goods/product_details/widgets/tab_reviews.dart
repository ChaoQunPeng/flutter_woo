/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-11 14:46:28
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-12 18:39:09
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/goods/product_details/widgets/tab_reviews.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../index.dart';

/// 评论
class TabReviewsView extends GetView<ProductDetailsController> {
  final String uniqueTag;

  const TabReviewsView({Key? key, required this.uniqueTag}) : super(key: key);

  @override
  String? get tag => uniqueTag;

  // 列表项
  _buildListItem(ReviewModel item) {
    return <Widget>[
      // 头像
      const ImageWidget.url(
        // item.reviewerAvatarUrls?["96"],
        // 测试需要改成自定义头像
        "https://i0.hdslb.com/bfs/face/ba49a43eae4793c261e1744a1ba1f8a1f3bc3047.jpg@120w_120h_1c.avif",
        width: 55,
        height: 55,
      ).paddingRight(AppSpace.listItem),

      // 星、名称、评论、图
      <Widget>[
        // 星
        StarsListWidget(
          value: item.rating ?? 0,
          size: 12,
        ),
        // 名称
        TextWidget.title3(
          item.reviewer ?? "",
        ),
        // 评论
        TextWidget.body1(
          item.review?.clearHtml ?? "",
        ),
        // 图
        _buildReviewImages(),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .expanded(),
    ].toRow(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  // 评论图
  Widget _buildReviewImages() {
    // 图
    List<Widget> list = controller.reviewImages
        .map((image) => ImageWidget.url(
              image,
              width: 45.w,
              height: 45.w,
            ))
        .toList();

    return <Widget>[...list].toWrap();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      tag: tag,
      id: "product_reviews",
      builder: (_) {
        return SmartRefresher(
          // 刷新控制器
          controller: controller.reviewsRefreshController,
          // 启用上拉加载
          enablePullUp: true,
          // 下拉刷新回调
          onRefresh: controller.onReviewsRefresh,
          // 上拉加载回调
          onLoading: controller.onReviewsLoading,
          // 底部加载更多
          footer: const SmartRefresherFooterWidget(),
          // 分隔符、间距
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              var item = controller.reviews[index];
              return _buildListItem(item);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: AppSpace.listRow * 2);
            },
            itemCount: controller.reviews.length,
          ),
        );
      },
    );
  }
}
