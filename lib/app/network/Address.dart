import 'package:mt_ik_sunyata/app/config/Config.dart';
///地址数据
class Address {
  static const String baseUrl = '${Config.PROTOCOL}${Config.HOST}:${Config.PORT}';

  static login() {
    return '$baseUrl/user/signIn';
  }
}