/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-06 13:59:50
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-07 23:44:16
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/api/user.dart
 * @Description: 
 */
import '../index.dart';

/// 用户 api
class UserApi {
  /// 注册
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await WPHttpService.to.post(
      '/users/register',
      data: req,
    );

    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }

  /// 登录
  static Future<UserTokenModel> login(UserLoginReq? req) async {
    var res = await WPHttpService.to.post(
      '/users/login',
      data: req,
    );
    return UserTokenModel.fromJson(res.data);
  }

  /// Profile
  static Future<UserProfileModel> profile() async {
    var res = await WPHttpService.to.get(
      '/users/me',
    );
    return UserProfileModel.fromJson(res.data);
  }
}