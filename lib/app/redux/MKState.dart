import 'package:flutter/material.dart';
import 'package:mt_ik_sunyata/app/model/User.dart';
import 'package:mt_ik_sunyata/app/redux/UserRedux.dart';
import 'package:mt_ik_sunyata/app/redux/ThemeRedux.dart';
import 'package:mt_ik_sunyata/app/redux/LocalRedux.dart';
/*
 * 全局Store.State
 */
class MKState {
  /// 用户信息
  User user;

  ///主题数据
  ThemeData themeData;

  ///语言
  Locale locale;

  ///当前手机平台默认语言
  Locale platformLocale;

  MKState({ this.user, this.themeData, this.locale, this.platformLocale });
}

MKState appReducer(MKState state, action) {
  return MKState(
    user: userReducer(state.user, action),
    themeData: themeDataReducer(state.themeData, action),
    locale: localeReducer(state.locale, action),
  );
}