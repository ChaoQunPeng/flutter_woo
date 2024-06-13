/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-13 11:13:05
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-13 11:13:48
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/api/coupon.dart
 * @Description: 
 */
// 优惠券
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

class CouponApi {
  /// 优惠券详情
  static Future<CouponsModel?> couponDetail(String code) async {
    var res = await WPHttpService.to.get(
      '/coupons',
      params: {
        "code": code,
      },
    );

    List<CouponsModel> coupons = [];
    for (var item in res.data) {
      coupons.add(CouponsModel.fromJson(item));
    }
    return coupons.isNotEmpty ? coupons.first : null;
  }
}