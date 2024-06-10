/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-10 10:26:10
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-10 10:39:02
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/models/woo/product_model/attribute.dart
 * @Description: 
 */
class Attribute {
  int? id;
  String? name;
  int? position;
  bool? visible;
  bool? variation;
  List<String>? options;

  Attribute({
    this.id,
    this.name,
    this.position,
    this.visible,
    this.variation,
    this.options,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json['id'] as int?,
        name: json['name'] as String?,
        position: json['position'] as int?,
        visible: json['visible'] as bool?,
        variation: json['variation'] as bool?,
        options: json['options']?.cast<String>(),
        // options: json['options'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'position': position,
        'visible': visible,
        'variation': variation,
        'options': options,
      };
}
