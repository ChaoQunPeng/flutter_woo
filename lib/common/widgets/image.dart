/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-03 23:38:23
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-04 00:13:34
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/widgets/image.dart
 * @Description: 
 */
import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';

import 'icon.dart';

enum ImageWidgetType { asset, network, file }

class ImageWidget extends StatelessWidget {
  /// 网址
  final String url;

  /// 类型
  final ImageWidgetType type;

  /// 圆角
  final double? radius;

  /// 宽度
  final double? width;

  /// 高度
  final double? height;

  /// 自适应方式
  final BoxFit? fit;

  /// 占位图
  final Widget? placeholder;

  /// 背景颜色
  final Color? backgroundColor;

  final Widget Function(
    BuildContext context,
    ImageProvider provider,
    Widget completed,
    Size? size,
  )? builder;

  const ImageWidget({
    super.key,
    required this.type,
    required this.url,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.backgroundColor,
    this.builder,
  });

  const ImageWidget.url(
    this.url, {
    super.key,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.backgroundColor,
    this.type = ImageWidgetType.network,
    this.builder,
  });

  const ImageWidget.asset(
    this.url, {
    Key? key,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.backgroundColor,
    this.builder,
  })  : type = ImageWidgetType.asset,
        super(key: key);

  const ImageWidget.file(
    this.url, {
    Key? key,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.backgroundColor,
    this.builder,
  })  : type = ImageWidgetType.file,
        super(key: key);

  Widget get _placeholder =>
      placeholder ??
      IconWidget.image(
        'assets/images/default.png',
        size: 36,
      );

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.all(
      Radius.circular(radius ?? AppRadius.image),
    );

    Widget? image;

    switch (type) {
      case ImageWidgetType.asset:
        image = ExtendedImage.asset(
          url,
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
        break;
      case ImageWidgetType.network:
        if (!url.contains('http')) break;
        image = ExtendedImage.network(
          url,
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
        break;
      case ImageWidgetType.file:
        image = ExtendedImage.file(
          File(url),
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
    }

    return Container(
      clipBehavior: Clip.antiAlias,
      width: width,
      height: height,
      child: image ?? _placeholder,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
    );
  }

  Widget _buildLoadState(BuildContext context, ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      // 正在读取
      case LoadState.loading:
        return _placeholder;
      // 读取成功
      case LoadState.completed:
        Size? size;
        if (state.extendedImageInfo != null) {
          size = Size(
            state.extendedImageInfo!.image.width.toDouble(),
            state.extendedImageInfo!.image.height.toDouble(),
          );
        }
        final provider = state.imageProvider;
        final completed = state.completedWidget;
        return builder?.call(context, provider, completed, size) ?? completed;
      // 读取失败
      case LoadState.failed:
        return const Center(
          child: Icon(
            CupertinoIcons.info_circle,
            size: 20,
            color: Colors.grey,
          ),
        );
    }
  }
}
