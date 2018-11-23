import 'package:flutter/material.dart';

class Mixed extends StatefulWidget {

    @override
    _MixedState createState() => new _MixedState();

}

class _MixedState extends State<Mixed> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(
                title: new Text('事上练'),
            ),
            body: new Container(
                child: new Center(
                    child: new Text('44444'),
                ),
            ),
        );
    }
}