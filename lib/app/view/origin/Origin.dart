import 'package:flutter/material.dart';

class Origin extends StatefulWidget {

    @override
    _OriginState createState() => new _OriginState();

}

class _OriginState extends State<Origin> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(
                title: new Text('缘起缘灭'),
            ),
            body: new Container(
                child: new Center(
                    child: new Text('22222'),
                ),
            ),
        );
    }
}