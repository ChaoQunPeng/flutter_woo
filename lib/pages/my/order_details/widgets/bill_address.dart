/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-13 15:32:08
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-13 15:34:06
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/my/order_details/widgets/bill_address.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

/// 订单地址项
class BuildBillAddress extends StatelessWidget {
  const BuildBillAddress({
    Key? key,
    this.title,
    this.address,
    this.city,
    this.state,
    this.country,
    this.phone,
  }) : super(key: key);

  final String? title, address, city, state, country, phone;

  Widget _buildView() {
    return <Widget>[
      // title
      TextWidget.title3(title ?? "", size: 15).paddingBottom(AppSpace.listItem),

      // address
      IconTextWidget(
        icon: IconWidget.icon(
          Icons.storefront,
          size: 15,
        ),
        text: address,
      ).paddingBottom(AppSpace.listItem),

      // address, city, state, country
      IconTextWidget(
        icon: IconWidget.icon(
          Icons.location_on_outlined,
          size: 15,
        ),
        text: "$city, $state, $country",
      ).paddingBottom(AppSpace.listItem),

      // phone
      IconTextWidget(
        icon: IconWidget.icon(
          Icons.phone_in_talk,
          size: 15,
        ),
        text: phone,
      ),
    ].toColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
