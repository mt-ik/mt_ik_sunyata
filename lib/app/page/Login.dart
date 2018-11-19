// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mt_ik_sunyata/app/common/config/config.dart';
import 'package:mt_ik_sunyata/app/common/local/localStorage.dart';
import 'package:mt_ik_sunyata/app/common/redux/MKState.dart';
import 'package:mt_ik_sunyata/app/widget/MKInput.dart';
import 'package:mt_ik_sunyata/app/widget/MKFlexButton.dart';
import 'package:mt_ik_sunyata/app/common/utils/MKNavigator.dart';
import 'package:mt_ik_sunyata/app/common/utils/CommonUtils.dart';
import 'package:mt_ik_sunyata/app/common/style/MKStyle.dart';
import 'package:mt_ik_sunyata/app/common/dao/UserDao.dart';

class Login extends StatefulWidget {
  static final String mkName = 'login';

  // @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  var _userName = '';
  var _passWord = '';
  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwController = new TextEditingController();

  _LoginState() : super();

  @override
  void initState() {
    super.initState();
    initParams();
  }

  initParams() async {
    _userName = await LocalStorage.get(Config.USER_NAME_KEY);
    _passWord = await LocalStorage.get(Config.USER_PW_KEY);
    userController.value = new TextEditingValue(text: _userName ?? '');
    pwController.value = new TextEditingValue(text: _passWord ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<MKState>(builder: (context, store) {
      return new GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: new Container(
          color: Theme.of(context).primaryColor,
          child: new Center(
            child: new Card(
              elevation: 5.0,
              shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: Color(MKColors.cardWhite),
              margin: const EdgeInsets.all(30.0),
              child: new Padding(
                padding: new EdgeInsets.only(left: 30.0, top: 40.0, right: 30.0, bottom: 80.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Image(image: new AssetImage(MKICons.DEFAULT_USER_ICON), width: 90.0, height: 90.0),
                    new Padding(padding: new EdgeInsets.all(10.0)),
                    new MKInput(
                      hintText: CommonUtils.getLocale(context).login_username_hint_text,
                      iconData: MKICons.LOGIN_USER,
                      onChanged: (String value) {
                        _userName = value;
                      },
                      controller: userController,
                    ),
                    new Padding(padding: new EdgeInsets.all(10.0)),
                    new MKInput(
                      hintText: CommonUtils.getLocale(context).login_password_hint_text,
                      iconData: MKICons.LOGIN_PW,
                      obscureText: true,
                      onChanged: (String value) {
                        _passWord = value;
                      },
                      controller: pwController,
                    ),
                    new Padding(padding: new EdgeInsets.all(30.0)),
                    new MKFlexButton(
                      text: CommonUtils.getLocale(context).login_text,
                      color: Theme.of(context).primaryColor,
                      textColor: Color(MKColors.textWhite),
                      onPress: () {
                        if (_userName == null || _userName.length == 0) {
                          return;
                        }
                        if (_passWord == null || _passWord.length == 0) {
                          return;
                        }
                        CommonUtils.showLoadingDialog(context);
                        UserDao.login(_userName.trim(), _passWord.trim(), store).then((res) {
                          Navigator.pop(context);
                          Map<String, bool> res = {
                            'result': true,
                          };
                          if (res != null) {
                            new Future.delayed(const Duration(seconds: 1), () {
                              MKNavigator.goHome(context);
                              return true;
                            });
                          }
                        });
                      },
                    )
                  ],
                ),
              ),

            ),
          ),
        ),
      );
    });
  }
}