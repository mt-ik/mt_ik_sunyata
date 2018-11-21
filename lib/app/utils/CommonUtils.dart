import 'dart:async';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mt_ik_sunyata/app/style/MKBase.dart';
import 'package:mt_ik_sunyata/app/style/MKStyle.dart';
import 'package:mt_ik_sunyata/app/localization/MKLocalizations.dart';
import 'package:mt_ik_sunyata/app/redux/ThemeRedux.dart';
import 'package:mt_ik_sunyata/app/redux/LocaleRedux.dart';

/*
 * 通用逻辑
 */
class CommonUtils {
    static Future<Null> showLoadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return new Material(
          color: Colors.transparent,
          child: WillPopScope(
            onWillPop: () => new Future.value(false),
            child: Center(
              child: new Container(
                width: 200.0,
                height: 200.0,
                padding: new EdgeInsets.all(4.0),
                decoration: new BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(child: SpinKitCubeGrid(color: Color(MKColors.white))),
                    new Container(height: 10.0),
                    new Container(child: new Text(CommonUtils.getLocale(context).loading_text, style: MKConstant.normalTextWhite)),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }

    static MKBase getLocale(BuildContext context) {
        return MKLocalizations.of(context).currentLocalized;
    }

    /// 切换主题
    static pushTheme(Store store, int index) {
        ThemeData themeData;
        List<Color> colors = getThemeListColor();
        themeData = new ThemeData(primarySwatch: colors[index], platform: TargetPlatform.iOS);
        store.dispatch(new RefreshThemeDataAction(themeData));
    }

    // 主题列表
    static List<Color> getThemeListColor() {
        return [
            MKColors.primarySwatch,
            Colors.brown,
            Colors.blue,
            Colors.teal,
            Colors.amber,
            Colors.blueGrey,
            Colors.deepOrange,
        ];
    }


    /// 切换语言
    static changeLocale(Store store, int index) {
        Locale locale = store.state.platformLocale;
        switch (index) {
            case 1:
                locale = Locale('zh', 'CH');
                break;
            case 2:
                locale = Locale('en', 'US');
                break;
        }
        
        store.dispatch(RefreshLocaleAction(locale));
    }
}
