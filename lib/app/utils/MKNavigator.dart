import 'package:flutter/material.dart';
import 'package:mt_ik_sunyata/app/view/Home.dart';
import 'package:mt_ik_sunyata/app/view/Login.dart';

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
        Navigator.pushReplacementNamed(context, Home.MK_ROUTER);
    }
    /// 登录页
    static goLogin(BuildContext context) {
        Navigator.pushReplacementNamed(context, Login.MK_ROUTER);
    }
}