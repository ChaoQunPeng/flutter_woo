/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-06 10:39:04
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-06 10:39:12
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/utils/validators.dart
 * @Description: 
 */
import 'package:flutter/material.dart';

/// 表单验证
class Validators {
  /// Validatorless.password(6, 20, 'password must have between 6 and 20 digits')
  static FormFieldValidator<String> password(int min, int max, String m) =>
      (v) {
        if (v?.isEmpty ?? true) return null;
        if ((v?.length ?? 0) < min) return m;
        if ((v?.length ?? 0) > max) return m;
        return null;
      };
}