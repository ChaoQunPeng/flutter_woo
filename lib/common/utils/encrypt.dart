/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-08 09:34:23
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-08 09:34:32
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/utils/encrypt.dart
 * @Description: 
 */
import 'package:encrypt/encrypt.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

/// 加密类
class EncryptUtil {
  static final EncryptUtil _instance = EncryptUtil._internal();
  factory EncryptUtil() => _instance;
  EncryptUtil._internal() {
    encrypter = Encrypter(AES(
      key,
      mode: AESMode.cbc,
      padding: 'PKCS7',
    ));
  }

  final key = Key.fromUtf8(Constants.aesKey);
  final iv = IV.fromUtf8(Constants.aesIV);
  late Encrypter encrypter;

  /// aes加密
  String aesEncode(String content) {
    final encrypted = encrypter.encrypt(content, iv: iv);
    return encrypted.base64;
  }
}