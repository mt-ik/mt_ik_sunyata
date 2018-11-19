import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mt_ik_sunyata/app/common/style/MKBase.dart';
import 'package:mt_ik_sunyata/app/common/style/MKStyle.dart';
import 'package:mt_ik_sunyata/app/common/localization/MKLocalizations.dart';

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
}
