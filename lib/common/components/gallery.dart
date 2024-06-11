/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-11 15:20:30
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-11 15:20:40
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/components/gallery.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

/// 图片浏览组件
class GalleryWidget extends StatelessWidget {
  /// 初始图片位置
  final int initialIndex;

  /// 图片列表
  final List<String> items;

  const GalleryWidget({
    Key? key,
    required this.initialIndex,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 不允许穿透
      behavior: HitTestBehavior.opaque,
      // 点击返回
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        // 全屏, 高度将扩展为包括应用栏的高度
        extendBodyBehindAppBar: true,

        // 背景黑色
        backgroundColor: Colors.black,

        // 导航栏 保留一个返回按钮
        appBar: AppBar(),

        // 图片内容
        body: PhotoViewGallery.builder(
          // 允许滚动超出边界，但之后内容会反弹回来。
          scrollPhysics: const BouncingScrollPhysics(),
          // 图片列表
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              // 图片内容
              imageProvider: NetworkImage(items[index]),
              // 初始尺寸 容器尺寸
              initialScale: PhotoViewComputedScale.contained,
              // 最小尺寸 容器尺寸
              minScale: PhotoViewComputedScale.contained,
              // 最大尺寸 容器尺寸 4 倍
              maxScale: PhotoViewComputedScale.covered * 4,
            );
          },

          // loading 载入标记
          loadingBuilder: (context, event) => CircularProgressIndicator(
            // 标记颜色
            backgroundColor: AppColors.highlight,
            // 进度
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 0),
          ).tightSize(30).center(),

          // 图片个数
          itemCount: items.length,

          // 初始控制器，默认图片位置
          pageController: PageController(initialPage: initialIndex),
        ),
      ),
    );
  }
}