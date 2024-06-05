/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 16:33:25
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-06 00:17:15
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/pages/system/--register/view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);


  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        // 头部标题
        PageTitleWidget(
          title: LocaleKeys.registerTitle.tr,
          desc: LocaleKeys.registerDesc.tr,
        ),

        // 表单
        _buildForm().card(),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .paddingHorizontal(AppSpace.page),
    );
  }

  // 表单页
  Widget _buildForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // username
        TextFormWidget(
          autofocus: true,
          controller: controller.userNameController,
          labelText: LocaleKeys.registerFormName.tr,
        ),

        // email
        TextFormWidget(
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          controller: controller.emailController,
          labelText: LocaleKeys.registerFormEmail.tr,
        ),

        // first name
        TextFormWidget(
          autofocus: true,
          controller: controller.firstNameController,
          labelText: LocaleKeys.registerFormFirstName.tr,
        ),

        // last name
        TextFormWidget(
          autofocus: true,
          controller: controller.lastNameController,
          labelText: LocaleKeys.registerFormLastName.tr,
        ),

        // password
        TextFormWidget(
          controller: controller.passwordController,
          labelText: LocaleKeys.registerFormPassword.tr,
          isObscure: true,
        ).paddingBottom(50),

        // 注册按钮
        _buildBtnSignUp(),

        // 提示文字
        _buildTips(),

        //
      ].toColumn(),
    ).paddingAll(AppSpace.card);
  }

  // 按钮
  Widget _buildBtnSignUp() {
    return ButtonWidget.primary(
      LocaleKeys.loginSignUp.tr,
      onTap: controller.onSignUp,
    ).paddingBottom(AppSpace.listRow);
  }

  // 提示
  Widget _buildTips() {
    return <Widget>[
      // 提示
      TextWidget.body2(LocaleKeys.registerHaveAccount.tr),
      // 登录文字按钮
      ButtonWidget.text(
        LocaleKeys.loginSignIn.tr,
        onTap: controller.onSignIn,
        textSize: 12,
        textColor: AppColors.primary,
      )
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("register")),
        );
      },
    );
  }
}
