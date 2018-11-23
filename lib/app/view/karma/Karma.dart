import 'package:flutter/material.dart';

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
            ),
            body: new Container(
                child: new Text('111111'),
            ),
        );
    }
}