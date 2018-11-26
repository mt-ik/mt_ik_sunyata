import 'package:flutter/material.dart';
import 'package:mt_ik_sunyata/app/style/MKStyle.dart';

class Karma extends StatefulWidget {

    @override
    _KarmaState createState() => new _KarmaState();
}
class _KarmaState extends State<Karma> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(
                title: new Text(
                    '业障'
                ),
                actions: <Widget>[
                    new IconButton(
                        icon: new Icon(MKICons.KARMA_SEARCH),
                        tooltip: 'Search',
                        onPressed: () {
                        print('我是Searching');
                        },
                    ),
                ],
            ),
            body: new Container(
                child: new Text('111111'),
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