/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 16:24:42
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-07 15:21:27
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/values/constants.dart
 * @Description: 
 */
/// 常量
class Constants {
  // 服务 api
  // static const wpApiBaseUrl = 'https://wpapi.ducafecat.tech';
  static const wpApiBaseUrl =
      "http://127.0.0.1:4523/m1/4619032-4268954-default";

  // 本地存储key
  static const storageLanguageCode = 'language_code';

  // 主题色
  static const storageThemeCode = 'theme_code';

  // 是否显示欢迎页面
  static const storageAlreadyOpen = 'already_open';

  static const storageToken = 'token'; // 登录成功后 token
  static const storageProfile = 'profile'; // 用户资料缓存
}
