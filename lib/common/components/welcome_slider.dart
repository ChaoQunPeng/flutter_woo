/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-05 14:08:02
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-05 14:44:06
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/components/welcome_slider.dart
 * @Description: 
 */
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

/// 欢迎 slider
class WelcomeSliderWidget extends StatelessWidget {
  /// 项目
  final List<WelcomeModel> items;

  /// 页数发生变化
  final Function(int) onPageChanged;

  /// 控制器
  final CarouselController? carouselController;

  const WelcomeSliderWidget(
    this.items, {
    Key? key,
    required this.onPageChanged,
    this.carouselController,
  }) : super(key: key);

  Widget sliderItem(WelcomeModel item) {
    return Builder(
      builder: (BuildContext context) {
        return <Widget>[
          // 图
          if (item.image != null)
            ImageWidget.asset(
              item.image!,
              fit: BoxFit.cover,
            ),

          // 标题
          if (item.title != null)
            TextWidget.title1(
              item.title ?? "",
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.center,
            ),

          // 描述
          if (item.desc != null)
            TextWidget.body1(
              item.desc ?? "",
              maxLines: 3,
              softWrap: true,
              textAlign: TextAlign.center,
            )
        ]
            .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
            .width(MediaQuery.of(context).size.width);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        height: 500.w,
        viewportFraction: 1, // 充满
        enlargeCenterPage: false, // 动画 封面效果
        enableInfiniteScroll: false, // 无限循环
        autoPlay: false, // 自动播放
        onPageChanged: (index, reason) => onPageChanged(index),
      ),
      items: items.map((item) => sliderItem(item)).toList(),
      // items: <Widget>[
      //   for (var item in items) sliderItem(item),
      // ].toList(),
    );
  }
}
