/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-06 14:24:05
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-06 15:30:07
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/models/request/error_message_model.dart
 * @Description: 
 */
/// 错误信息
class ErrorMessageModel {
  int? statusCode;
  String? error;
  String? message;

  ErrorMessageModel({this.statusCode, this.error, this.message});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['statusCode'] as int?,
      error: json['error'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'error': error,
        'message': message,
      };
}
