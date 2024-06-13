/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-13 15:15:53
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-13 15:20:09
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/components/steps.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

/// 状态枚举
enum StepStatus {
  none,
  running,
  success,
}

/// 横向状态
class StepHorizontalItemWidget extends StatelessWidget {
  /// 状态名称
  final String statusName;

  /// 状态
  final StepStatus status;

  const StepHorizontalItemWidget({
    Key? key,
    required this.statusName,
    this.status = StepStatus.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return <Widget>[
          // 指示标
          <Widget>[
            // 横线 - 灰色打底
            Container(
              color: const Color.fromARGB(255, 213, 213, 213),
              height: 3,
            ),
            // 横线
            if (status == StepStatus.success)
              Container(
                color: AppColors.primary,
                height: 3,
              ),
            if (status == StepStatus.running)
              Container(
                color: AppColors.primary,
                height: 3,
                width: constraints.minWidth / 2,
              ).alignLeft(),
            // 圆点
            Container(
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                color: status == StepStatus.none
                    ? AppColors.surfaceVariant.withOpacity(0.5)
                    : AppColors.primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(7 / 2),
                ),
              ),
            ),
          ]
              .toStack(
                alignment: Alignment.center,
              )
              .paddingBottom(AppSpace.iconTextSmail),

          // 文字
          TextWidget.body3(
            statusName,
          ),
        ].toColumn();
      },
    ).expanded();
  }
}