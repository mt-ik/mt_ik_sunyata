import 'package:flutter/material.dart';

class Soul extends StatefulWidget {

    @override
    _SoulState createState() => new _SoulState();
}

class _SoulState extends State<Soul> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(
                title: new Text('致良知'),
            ),
            body: new Container(
                child: new Center(
                    child: new Text('魂兮归来'),
                ),
            ),
            floatingActionButton: new FloatingActionButton(
                tooltip: 'Add', // used by assistive technologies
                child: new Icon(Icons.add),
                onPressed: () {
                    print('哈哈， 我执行了');
                }
            ),
        );
    }
}