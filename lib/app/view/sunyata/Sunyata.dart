import 'package:flutter/material.dart';

class Sunyata extends StatefulWidget {

  @override
  _SunyataState createState() => new _SunyataState();

}

class _SunyataState extends State<Sunyata> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('K_X'),
            backgroundColor: Theme.of(context).primaryColor,
        ),
        body: new Center(
            child: new Text('空相111'),
        ),
    );
  }

}