/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-13 14:45:46
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-13 14:45:53
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/models/request/order.dart
 * @Description: 
 */
/// 订单查询请求
class OrdersReq {
  final int? page;
  final int? prePage;

  OrdersReq({
    this.page,
    this.prePage,
  });

  Map<String, dynamic> toJson() => {
        'page': page ?? 1,
        'pre_page': prePage ?? 10,
      };
}