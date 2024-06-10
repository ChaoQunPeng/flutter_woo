/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-01 16:24:42
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-10 17:42:34
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/values/constants.dart
 * @Description: 
 */
/// 常量
class Constants {
  // 服务 api
  static const wpApiBaseUrl = 'https://wpapi.ducafecat.tech';
  // static const wpApiBaseUrl =
  //     "http://127.0.0.1:4523/m1/4619032-4268954-default";
  // static const wpApiBaseUrl = 'http://127.0.0.1:3000';

  // 本地存储key
  static const storageLanguageCode = 'language_code';

  // 主题色
  static const storageThemeCode = 'theme_code';

  // 是否显示欢迎页面
  static const storageAlreadyOpen = 'already_open';

  static const storageToken = 'token'; // 登录成功后 token
  static const storageProfile = 'profile'; // 用户资料缓存

  // AES
  static const aesKey = 'aH5aH5bG0dC6aA3oN0cK4aU5jU6aK2lN';
  static const aesIV = 'hK6eB4aE1aF3gH5q';

  // 首页离线
  static const storageHomeBanner = 'home_banner';
  static const storageHomeCategories = 'home_categories';
  static const storageHomeFlashSell = 'home_flash_sell';
  static const storageHomeNewSell = 'home_new_sell';
}
