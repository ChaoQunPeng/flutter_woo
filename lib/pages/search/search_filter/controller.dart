/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:17:45
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-12 16:49:39
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/search/search_filter/controller.dart
 * @Description: 
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class SearchFilterController extends GetxController {
  SearchFilterController();

  // 排序列表
  List<KeyValueModel> orderList = [
    KeyValueModel(key: "rating", value: "Best Match"),
    KeyValueModel(key: "price_low", value: "Price (low to high)"),
    KeyValueModel(key: "price_high", value: "Price (high to low)"),
    KeyValueModel(key: "popularity", value: "Popularity"),
    KeyValueModel(key: "date", value: "New publish"),
    KeyValueModel(key: "title", value: "Product name"),
    KeyValueModel(key: "slug", value: "Slug name"),
  ];
  // 排序选中
  KeyValueModel orderSelected =
      KeyValueModel(key: "rating", value: "Best Match");

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // 价格范围 0~1000
  final List<double> priceRange = [100, 1000];

  // 尺寸列表
  List<KeyValueModel<AttributeModel>> sizes = [];
  // 选中尺寸列表
  List<String> sizeKeys = [];

  // 颜色列表
  List<KeyValueModel<AttributeModel>> colors = [];
  // 选中颜色列表
  List<String> colorKeys = [];

  // 星级
  int starValue = -1;

  // 星级选中
  void onStarTap(int value) {
    starValue = value;
    update(["filter_stars"]);
  }

  // Brand
  List<KeyValueModel<AttributeModel>> brands = [];
  List<String> brandKeys = [];

  // Gender
  List<KeyValueModel<AttributeModel>> genders = [];
  List<String> genderKeys = [];

  // Condition
  List<KeyValueModel<AttributeModel>> conditions = [];
  List<String> conditionKeys = [];

  // 读取缓存
  void _loadCache() async {
    // 尺寸列表
    {
      String result =
          Storage().getString(Constants.storageProductsAttributesSizes);
      sizes = jsonDecode(result).map<KeyValueModel<AttributeModel>>((item) {
        var arrt = AttributeModel.fromJson(item);
        return KeyValueModel(key: "${arrt.name}", value: arrt);
      }).toList();
    }

    // 颜色列表
    {
      String result =
          Storage().getString(Constants.storageProductsAttributesColors);
      colors = jsonDecode(result).map<KeyValueModel<AttributeModel>>((item) {
        var arrt = AttributeModel.fromJson(item);
        return KeyValueModel(key: "${arrt.name}", value: arrt);
      }).toList();
    }

    // 品牌列表
    {
      String result =
          Storage().getString(Constants.storageProductsAttributesBrand);
      brands = jsonDecode(result).map<KeyValueModel<AttributeModel>>((item) {
        var arrt = AttributeModel.fromJson(item);
        return KeyValueModel(key: "${arrt.name}", value: arrt);
      }).toList();
    }

    // 性别列表
    {
      String result =
          Storage().getString(Constants.storageProductsAttributesGender);
      genders = jsonDecode(result).map<KeyValueModel<AttributeModel>>((item) {
        var arrt = AttributeModel.fromJson(item);
        return KeyValueModel(key: "${arrt.name}", value: arrt);
      }).toList();
    }

    // 新旧列表
    {
      String result =
          Storage().getString(Constants.storageProductsAttributesCondition);
      conditions =
          jsonDecode(result).map<KeyValueModel<AttributeModel>>((item) {
        var arrt = AttributeModel.fromJson(item);
        return KeyValueModel(key: "${arrt.name}", value: arrt);
      }).toList();
    }
  }

  // 品牌选中
  void onBrandTap(List<String> keys) {
    brandKeys = keys;
    update(["filter_brands"]);
  }

  // 性别选中
  void onGenderTap(List<String> keys) {
    genderKeys = keys;
    update(["filter_genders"]);
  }

  // 新旧选中
  void onConditionTap(List<String> keys) {
    conditionKeys = keys;
    update(["filter_conditions"]);
  }

  // 颜色选中
  void onColorTap(List<String> keys) {
    colorKeys = keys;
    update(["filter_colors"]);
  }

  // 价格区间拖动
  onPriceRangeDragging(
    int handlerIndex,
    dynamic lowerValue,
    dynamic upperValue,
  ) {
    priceRange[0] = lowerValue as double;
    priceRange[1] = upperValue as double;
    update(["filter_price_range"]);
  }

  // 筛选 打开
  void onFilterOpenTap() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  // 筛选 关闭
  void onFilterCloseTap() {
    Get.back();
  }

  // 排序选中
  void onOrderTap(KeyValueModel? val) {
    orderSelected = val!;
    update(["search_filter"]);
  }

  _initData() {
    update(["search_filter"]);
  }

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
    _loadCache();
  }

  // 尺寸选中
  void onSizeTap(List<String> keys) {
    sizeKeys = keys;
    update(["filter_sizes"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
