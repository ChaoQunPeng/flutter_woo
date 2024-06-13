/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 18:18:33
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-13 15:32:34
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/my/order_details/view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/bill_address.dart';

class OrderDetailsPage extends GetView<OrderDetailsController> {
  const OrderDetailsPage({Key? key}) : super(key: key);

  // 标题
  Widget _buildTitle() {
    return <Widget>[
      // Order ID
      TextWidget.title3(
              "${LocaleKeys.orderDetailsOrderID.tr} : ${controller.order.id}")
          .expanded(),

      // 15 Jan 2019
      TextWidget.body2("${controller.order.dateCreated?.dateFormatOfyyyyMMdd}"),
    ].toRow().padding(
          top: AppSpace.page,
          bottom: AppSpace.listRow,
          left: AppSpace.page,
          right: AppSpace.page,
        );
  }

  // 横向状态
  Widget _buildHorizontalStatus() {
    return <Widget>[
      const StepHorizontalItemWidget(
        statusName: "Pending",
        status: StepStatus.success,
      ),
      const StepHorizontalItemWidget(
        statusName: "Confirmed",
        status: StepStatus.success,
      ),
      const StepHorizontalItemWidget(
        statusName: "Processing",
        status: StepStatus.running,
      ),
      const StepHorizontalItemWidget(
        statusName: "Picked",
        status: StepStatus.none,
      ),
      const StepHorizontalItemWidget(
        statusName: "Shipped",
        status: StepStatus.none,
      ),
      const StepHorizontalItemWidget(
        statusName: "Delivered",
        status: StepStatus.none,
      ),
    ].toRow().padding(
          bottom: AppSpace.listRow,
          left: AppSpace.page,
          right: AppSpace.page,
        );
  }

  // 纵向状态
  Widget _buildVerticalStatus() {
    return <Widget>[
      const StepVerticalItemWidget(
        statusName: "Delivered",
        statusDateTime: "20 Jan, 2019",
        statusDes:
            "Lorem Ipsum is simply dumy text of printing and typesetting industry.",
        status: StepStatus.none,
      ),
      const StepVerticalItemWidget(
        statusName: "Shipped",
        statusDateTime: "20 Jan, 2019",
        statusDes:
            "Lorem Ipsum is simply dumy text of printing and typesetting industry.",
        status: StepStatus.none,
      ),
      const StepVerticalItemWidget(
        statusName: "Picked",
        statusDateTime: "20 Jan, 2019",
        statusDes:
            "Lorem Ipsum is simply dumy text of printing and typesetting industry.",
        status: StepStatus.running,
      ),
      const StepVerticalItemWidget(
        statusName: "Processing",
        statusDateTime: "20 Jan, 2019",
        statusDes:
            "Lorem Ipsum is simply dumy text of printing and typesetting industry.",
        status: StepStatus.success,
      ),
      const StepVerticalItemWidget(
        statusName: "Confirm",
        statusDateTime: "20 Jan, 2019",
        statusDes:
            "Lorem Ipsum is simply dumy text of printing and typesetting industry.",
        status: StepStatus.success,
      ),
      const StepVerticalItemWidget(
        statusName: "Pending",
        statusDateTime: "20 Jan, 2019",
        statusDes:
            "Lorem Ipsum is simply dumy text of printing and typesetting industry.",
        status: StepStatus.success,
      ),
    ].toColumn().padding(
          bottom: AppSpace.listRow,
          left: AppSpace.page,
          right: AppSpace.page,
        );
  }

  // 寄件地、目的地
  Widget _buildBillAddress() {
    return <Widget>[
      // Bill From, 商家发货地址写死
      BuildBillAddress(
        title: LocaleKeys.orderDetailsBillFrom.tr,
        address: "Adidas Shoes",
        city: "Kingston",
        state: "New York",
        country: "United States",
        phone: "+44-213 543 230",
      ).expanded(),

      // 间距
      SizedBox(
        width: AppSpace.iconTextMedium,
      ),

      // Bill To
      BuildBillAddress(
        title: LocaleKeys.orderDetailsBillTo.tr,
        address: controller.order.shipping?.address1,
        city: controller.order.shipping?.city,
        state: controller.order.shipping?.state,
        country: controller.order.shipping?.country,
        phone: controller.order.billing?.phone,
      ).expanded(),
    ].toRow().paddingAll(AppSpace.card).card().paddingBottom(AppSpace.listRow);
  }

  // 商品列表
  Widget _buildProductsList() {
    return const Text("商品列表");
  }

  // 小计
  Widget _buildTotal() {
    return const Text("小计");
  }

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        // 标题
        _buildTitle(),

        // 横向状态
        _buildHorizontalStatus(),

        // 纵向状态
        _buildVerticalStatus(),

        // 寄件地、目的地
        _buildBillAddress(),

        // 商品列表
        _buildProductsList(),

        // 小计
        _buildTotal(),

        // 底部间距
        const SizedBox(height: 100),

        // end
      ].toColumn(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailsController>(
      init: OrderDetailsController(),
      id: "order_details",
      builder: (_) {
        return Scaffold(
          appBar:
              mainAppBarWidget(titleString: LocaleKeys.orderDetailsTitle.tr),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
