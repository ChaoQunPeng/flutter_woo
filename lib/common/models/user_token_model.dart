/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-07 23:41:15
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-07 23:42:05
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/models/user_token_model.dart
 * @Description: 
 */
class UserTokenModel {
  String? token;

  UserTokenModel({this.token});

  factory UserTokenModel.fromJson(Map<String, dynamic> json) {
    return UserTokenModel(
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
