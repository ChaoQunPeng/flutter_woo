import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class LoginQuickPage extends GetView<LoginQuickController> {
  const LoginQuickPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // logo
      const ImageWidget.asset(
        AssetsImages.logoPng,
        width: 60,
        height: 57,
      ).paddingBottom(20),

      // 标题1
      const TextWidget.title2("让我们登录进去", color: Colors.white).paddingBottom(20),

      // 标题2
      TextWidget.title2(
        "欢迎！！！",
        color: AppColors.onPrimary,
      ).paddingBottom(55),

      // 表单
      <Widget>[
        // 用户名
        const TextWidget.body1(
          "用户名或邮箱",
          color: Color(0xff838383),
        ).paddingBottom(AppSpace.listRow),

        InputWidget.iconTextFilled(IconWidget.icon(Icons.person))
            .paddingBottom(AppSpace.listRow * 2),

        // 密码
        const TextWidget.body1(
          "密码",
          color: Color(0xff838383),
        ).paddingBottom(AppSpace.listRow),

        InputWidget.iconTextFilled(IconWidget.icon(Icons.lock))
            .paddingBottom(30),

        const ButtonWidget.primary(
          "登录",
          backgroundColor: Colors.orange,
        ).tight(width: double.infinity, height: 57),

        // const SizedBox(height: 20,),
        // 注册
        <Widget>[
          const TextWidget.body1(
            "没有账号? ",
            color: Colors.grey,
          ),
          ButtonWidget.text(
            "点我注册",
            textWeight: FontWeight.bold,
          )
        ].toRow(
          mainAxisAlignment: MainAxisAlignment.end,
        )

        // end
      ]
          .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
          .paddingAll(20)
          .card(color: Colors.white)
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
        )
        .paddingHorizontal(15);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginQuickController>(
      init: LoginQuickController(),
      id: "login_quick",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("快捷登录"),
            backgroundColor: const Color(0xff0274BC),
            shadowColor: Colors.transparent,
          ),
          backgroundColor: const Color(0xff0274BC),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
