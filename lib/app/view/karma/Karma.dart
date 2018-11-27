import 'package:flutter/material.dart';
import 'package:mt_ik_sunyata/app/style/MKStyle.dart';
import 'package:url_launcher/url_launcher.dart';

class Karma extends StatefulWidget {

    @override
    _KarmaState createState() => new _KarmaState();
}
class _KarmaState extends State<Karma> {

    _launchURL() async {
        const url = 'sms:18518165912';
        if (await canLaunch(url)) {
            await launch(url);
        } else {
            throw 'Could not launch $url';
        }
    }


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(
                title: new Text(
                    '测试'
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
                child: new Center(
                    child: RaisedButton(
                        onPressed: _launchURL,
                        child: Text('Show Flutter homepage'),
                    ),
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