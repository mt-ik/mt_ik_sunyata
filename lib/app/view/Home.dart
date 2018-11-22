import 'package:flutter/material.dart';
import 'package:mt_ik_sunyata/app/utils/CommonUtils.dart';
import 'package:mt_ik_sunyata/app/style/MKStyle.dart';
import 'package:mt_ik_sunyata/app/widget/MKTabBar.dart';
import 'package:mt_ik_sunyata/app/view/sunyata/Sunyata.dart';

class Home extends StatelessWidget {
    static const String MK_ROUTER = 'home';

    /// 单击提示推出
    Future<bool> _dialogExitApp(BuildContext context) {
        return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
                content: new Text(CommonUtils.getLocale(context).appBackTip),
                actions: <Widget>[
                    new FlatButton(
                        onPressed: () => Navigator.of(context).pop(false), 
                        child: new Text(CommonUtils.getLocale(context).appCancel)
                    ),
                    new FlatButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: new Text(CommonUtils.getLocale(context).appOk),
                    ),
                ],
            )
        );
    }
  
    /// 生成tab标签
    _renderTab(IconData icon, String text) {
        return new Tab(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    new Icon(icon, size: 24),
                    new Text(text),
                ],
            ),
        );
    }
    @override
    Widget build(BuildContext context) {
        List<Widget> tabs = [
            _renderTab(MKICons.MAIN_SUNYATA, CommonUtils.getLocale(context).mainSunyata),
            _renderTab(MKICons.MAIN_ORIGIN, CommonUtils.getLocale(context).mainOrigin),
            _renderTab(MKICons.MAIN_SOUL, CommonUtils.getLocale(context).mainSoul),
            _renderTab(MKICons.MAIN_MIXED, CommonUtils.getLocale(context).mainMixed),
            _renderTab(MKICons.MAIN_MINE, CommonUtils.getLocale(context).mainMine),
        ];
        return WillPopScope(
            onWillPop: () {
                return _dialogExitApp(context);
            },
            child: new MKTabBar(
                drawer: null,
                type: MKTabBar.BOTTOM_TAB,
                tabItems: tabs,
                tabViews: <Widget>[
                    new Sunyata(),
                    new Center(
                        child: new Text('杂之'),
                    ),
                    new Center(
                        child: new Text(
                            '魂兮归来',
                            style: TextStyle(
                                fontSize: 32.0
                            )
                        ),
                        
                    ),
                    new Center(
                        child: new Text('缘体'),
                    ),
                    new Center(
                        child: new Text('我执'),
                    ),
                ],
                backgroundColor: MKColors.primarySwatch,
                indicatorColor: Color(MKColors.white),
                title: new Text('测试'),
            ),
        );
    }
}