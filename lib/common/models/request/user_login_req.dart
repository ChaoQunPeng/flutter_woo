/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-07 15:22:11
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-07 15:22:16
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/models/request/user_login.dart
 * @Description: 
 */
/// 用户登录
class UserLoginReq {
  String? username;
  String? password;

  UserLoginReq({
    this.username,
    this.password,
  });

  factory UserLoginReq.fromJson(Map<String, dynamic> json) {
    return UserLoginReq(
      username: json['username'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
