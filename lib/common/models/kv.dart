/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-10 09:49:56
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-10 09:50:04
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/models/kv.dart
 * @Description: 
 */
/// key value 键值对
class KeyValueModel<T> {
  String key;
  T value;

  KeyValueModel({required this.key, required this.value});

  factory KeyValueModel.fromJson(Map<String, dynamic> json) {
    return KeyValueModel(
      key: json['key'] as String,
      value: json['value'] as T,
    );
  }

  Map<String, dynamic> toJson() => {
        'key': key,
        'value': value,
      };

  @override
  String toString() {
    return "$value";
  }
}
