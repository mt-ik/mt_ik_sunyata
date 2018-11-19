import 'package:mt_ik_sunyata/app/common/config/config.dart';
///地址数据
class Address {
  static const String host = "http://localhost:3000";
  static const String baseUrl = 'http://localhost:3000';
  ///获取授权  post
  static getAuthorization() {
    // return "${host}authorizations";
    return "${host}";
  }

  static login() {
    return '$baseUrl/user/signIn';
  }
}