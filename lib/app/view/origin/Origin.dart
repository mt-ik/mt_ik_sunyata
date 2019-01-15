import 'package:flutter/material.dart';
import 'package:mt_ik_sunyata/app/view/origin/origin/ChatList.dart';
class Origin extends StatefulWidget {

    @override
    _OriginState createState() => new _OriginState();

}

class _OriginState extends State<Origin> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(
                title: new Text('测试'),
            ),
            body: new Container(
                child: new Center(
                    child: new ChatList(),
                ),
            ),
        );
    }
}