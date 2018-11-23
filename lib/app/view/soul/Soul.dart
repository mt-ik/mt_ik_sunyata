import 'package:flutter/material.dart';
import 'package:mt_ik_sunyata/app/utils/MKNavigator.dart';
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
                title: new Text('···'),
            ),
            body: new Container(
                child: new Center(
                    child: new Text('归来'),
                ),
            ),
            floatingActionButton: new FloatingActionButton(
                tooltip: 'Add',
                child: new Icon(Icons.add),
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