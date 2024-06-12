/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:17:45
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-12 15:24:03
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/search/search_filter/controller.dart
 * @Description: 
 */
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

  // 排序选中
  void onOrderTap(KeyValueModel? val) {
    orderSelected = val!;
    update(["search_filter"]);
  }

  _initData() {
    update(["search_filter"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

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
