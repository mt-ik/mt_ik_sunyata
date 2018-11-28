import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:mt_ik_sunyata/app/style/MKImage.dart';
import 'package:mt_ik_sunyata/app/redux/MKState.dart';
import 'package:mt_ik_sunyata/app/utils/MKNavigator.dart';
import 'package:mt_ik_sunyata/app/service/UserService.dart';
import 'package:mt_ik_sunyata/app/utils/CommonUtils.dart';

class Welcome extends StatefulWidget {

  static const String MK_ROUTER = '/';

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  
  bool hadInit = false;

  @override
  void didChangeDependencies() { /// 生命周期函数
    super.didChangeDependencies();

    if (hadInit) {
      return;
    }

    hadInit = true;
    Store<MKState> store = StoreProvider.of(context);
    new Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
        UserService.initUser(store).then((res) {
            if (res != null && res.result) {
                MKNavigator.goHome(context);
            } else {
                MKNavigator.goLogin(context);
            }
            return true;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MKState>(
      builder: (context, store) {
        return new Container(
            color: Colors.white,
            child: new ConstrainedBox( /// 设置容器
                child: MKImage.welcomeImage,
                // child: new Center(
                //     child: new Text(CommonUtils.getLocale(context).welcomeMessage),
                // ),
                constraints: new BoxConstraints.expand(), /// 子元素充满父容器
            )
        );
      },
    );
  }
}