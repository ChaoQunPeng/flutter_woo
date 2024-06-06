/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-06 13:59:50
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-06 15:14:40
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
}
