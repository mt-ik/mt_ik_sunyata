import 'package:flutter/material.dart';
import 'package:mt_ik_sunyata/app/page/Home.dart';
import 'package:mt_ik_sunyata/app/page/Login.dart';

class MKNavigator {
  /// 替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }
  /// 切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
  /// 主页
  static goHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, Home.mkName);
  }
  /// 登录页
  static goLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, Login.mkName);
  }
}