import 'dart:developer';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mt_ik_sunyata/app/config/Config.dart';
import 'package:mt_ik_sunyata/app/local/LocalStorage.dart';
import 'package:mt_ik_sunyata/app/redux/MKState.dart';
import 'package:mt_ik_sunyata/app/widget/MKInput.dart';
import 'package:mt_ik_sunyata/app/widget/MKFlexButton.dart';
import 'package:mt_ik_sunyata/app/utils/MKNavigator.dart';
import 'package:mt_ik_sunyata/app/utils/CommonUtils.dart';
import 'package:mt_ik_sunyata/app/style/MKStyle.dart';
import 'package:mt_ik_sunyata/app/service/UserService.dart';

class Login extends StatefulWidget {
  static const String MK_ROUTER = 'login';

  @override
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

    /// 本地获取用户名和密码初始化
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
                            elevation: 10.0,
                            shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            color: Color(MKColors.cardWhite),
                            margin: const EdgeInsets.all(30.0),
                            child: new Padding(
                                padding: new EdgeInsets.only(left: 30.0, top: 40.0, right: 30.0, bottom: 80.0),
                                child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                        new Image(image: new AssetImage(MKICons.DEFAULT_USER_ICON), width: 100.0, height: 100.0),
                                        new Padding(padding: new EdgeInsets.all(10.0)),
                                        new MKInput(
                                            hintText: CommonUtils.getLocale(context).loginUsernameHintText,
                                            iconData: MKICons.LOGIN_USER,
                                            onChanged: (String value) {
                                                _userName = value;
                                            },
                                            controller: userController,
                                        ),
                                        new Padding(padding: new EdgeInsets.all(10.0)),
                                        new MKInput(
                                            hintText: CommonUtils.getLocale(context).loginPasswordHintText,
                                            iconData: MKICons.LOGIN_PW,
                                            obscureText: true,
                                            onChanged: (String value) {
                                                _passWord = value;
                                            },
                                            controller: pwController,
                                        ),
                                        new Padding(padding: new EdgeInsets.all(30.0)),
                                        new MKFlexButton(
                                            text: CommonUtils.getLocale(context).loginText,
                                            color: Theme.of(context).primaryColor,
                                            textColor: Color(MKColors.textWhite),
                                            onPress: () {
                                                if (_userName == null || _userName.length == 0) {
                                                    return;
                                                }
                                                if (_passWord == null || _passWord.length == 0) {
                                                    return;
                                                }
                                                CommonUtils.showLoadingDialog(context, CommonUtils.getLocale(context).loginLoadingText);
                                                UserService.login(_userName.trim(), _passWord.trim(), store).then((res) {
                                                    if (res != null && res.result) {
                                                        new Future.delayed(const Duration(microseconds: 666), () {
                                                            Navigator.pop(context);
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