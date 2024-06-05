/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-05 14:04:57
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-05 14:05:07
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/models/welcome_model.dart
 * @Description: 
 */
/// 欢迎数据 Model
class WelcomeModel {
  /// 图片url
  String? image;

  /// 标题
  String? title;

  /// 说明
  String? desc;

  WelcomeModel({this.image, this.title, this.desc});

  // WelcomeModel.fromJson(dynamic json) {
  //   image = json["image"];
  //   title = json["title"];
  //   desc = json["desc"];
  // }

  // Map<String, dynamic> toJson() {
  //   var map = <String, dynamic>{};
  //   map["image"] = image;
  //   map["title"] = title;
  //   map["desc"] = desc;
  //   return map;
  // }
}