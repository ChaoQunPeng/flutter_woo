/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-12 22:17:05
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-12 22:17:39
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/models/woo/continents_model/state.dart
 * @Description: 
 */
class State {
  String? code;
  String? name;

  State({
    this.code,
    this.name,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        code: "${json['code']}",
        name: "${json['name']}",
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
      };
}
