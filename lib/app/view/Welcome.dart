import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:mt_ik_sunyata/app/redux/MKState.dart';
import 'package:mt_ik_sunyata/app/utils/MKNavigator.dart';


class Welcome extends StatefulWidget {

  static final mkName = '/';

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  
  bool hadInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(hadInit);
    if (hadInit) {
      return;
    }
    hadInit = true;
    Store<MKState> store = StoreProvider.of(context);
    new Future.delayed(const Duration(seconds: 2), () {
      // UserDao.initUser(store).then((res) {
        bool res = false;
        if (res != null && res) {
          MKNavigator.goHome(context);
        } else {
          MKNavigator.goLogin(context);
        }
        return true;
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MKState>(
      builder: (context, store) {
        return new Container(
          color: Colors.white,
          child: new Center(
            child: new Image(image: new AssetImage('assets/images/welcome.png')),
          ),
        );
      },
    );
  }
}