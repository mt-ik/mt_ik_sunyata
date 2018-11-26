import 'package:flutter/material.dart';
import 'package:mt_ik_sunyata/app/style/MKStyle.dart';
import 'package:mt_ik_sunyata/app/utils/CommonUtils.dart';
import 'package:mt_ik_sunyata/app/view/soul/PurifySoul.dart';

class Soul extends StatefulWidget {

    @override
    _SoulState createState() => new _SoulState();
}

class _SoulState extends State<Soul> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(
                title: new Text(CommonUtils.getLocale(context).soulTitle),
                actions: <Widget>[
                    new IconButton(
                        icon: new Icon(MKICons.SOUL_SEARCH),
                        tooltip: 'Search',
                        onPressed: () {
                        print('我是Searching');
                        },
                    ),
                ],
            ),
            body: new Container(
                child: new Center(
                    child: new Text('归来'),
                ),
            ),
            floatingActionButton: new FloatingActionButton(
                tooltip: 'Add',
                child: new Icon(MKICons.SOUL_EDIT),
                onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) {
                          return new PurifySoul();
                        }
                    ));
                },
            ),
        );
    }
}