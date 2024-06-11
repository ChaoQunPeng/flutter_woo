/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-11 14:26:43
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-11 15:03:31
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/goods/product_details/controller.dart
 * @Description: 
 */
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  ProductDetailsController();

  // 商品 id , 获取路由传递参数
  int? productId = Get.arguments['id'] ?? 0;
  // 商品详情
  ProductModel? product;
  // Banner 数据
  List<KeyValueModel> bannerItems = [];
  // Banner 当前位置
  int bannerCurrentIndex = 0;

  _initData() async {
    await _loadProduct();

    update(["product_details"]);
  }

  // 拉取商品详情
  _loadProduct() async {
    // 商品详情
    product = await ProductApi.productDetail(productId);

    // Banner 数据
    if (product?.images != null) {
      bannerItems = product!.images!
          .map<KeyValueModel>((e) => KeyValueModel(
                key: "${e.id}",
                value: e.src ?? "",
              ))
          .toList();
    }
  }

  // Banner 切换事件
  void onChangeBanner(int index, _reason) {
    bannerCurrentIndex = index;
    update(["product_banner"]); // 手动刷新 Banner
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
