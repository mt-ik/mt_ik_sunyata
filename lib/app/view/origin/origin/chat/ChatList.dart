import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
    
    @override
    _ChatListState createState() => new _ChatListState();
}

class _ChatListState extends State<ChatList> {
    @override
    Widget build(BuildContext context) {
        return new Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: new Column(
                children: <Widget>[
                    new Container(
                        child: new Row(
                            children: <Widget>[
                                new Container(
                                    padding: EdgeInsets.only(right: 10),
                                    child: new Image(
                                        height: 50,
                                        width: 50,
                                        image: new AssetImage('assets/sunyata/mt_ik_tx.jpg'),
                                    ),
                                ),
                                new Expanded(
                                    child: new Container(
                                        height: 65,
                                        child: new Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                                new Expanded(
                                                    child: new Container(
                                                        height: 45,
                                                        child: new Row(
                                                            children: <Widget>[
                                                                new Column(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: <Widget>[
                                                                        new Text('title'),
                                                                        new Text('time')
                                                                    ],
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                ),
                                                new Container(
                                                    margin: EdgeInsets.only(left: 10),
                                                    width: 50,
                                                    height: 50,
                                                    child: new Column(
                                                        children: <Widget>[
                                                            new Expanded(
                                                                child: new Text('aa'),
                                                            ),
                                                            new Text('bbb')
                                                        ],
                                                    )
                                                )
                                            ],
                                        ),
                                        decoration: new BoxDecoration(
                                            border: new Border(bottom: new BorderSide(
                                                color: Colors.grey
                                            ))
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                    new Container(
                        child: new Row(
                            children: <Widget>[
                                new Container(
                                    padding: EdgeInsets.only(right: 10),
                                    child: new Image(
                                        height: 50,
                                        width: 50,
                                        image: new AssetImage('assets/sunyata/mt_ik_tx.jpg'),
                                    ),
                                ),
                                new Expanded(
                                    child: new Container(
                                        height: 65,
                                        child: new Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                                new Expanded(
                                                    child: new Container(
                                                        height: 45,
                                                        child: new Row(
                                                            children: <Widget>[
                                                                new Column(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: <Widget>[
                                                                        new Text('title'),
                                                                        new Text('time')
                                                                    ],
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                ),
                                                new Container(
                                                    margin: EdgeInsets.only(left: 10),
                                                    width: 50,
                                                    height: 50,
                                                    child: new Column(
                                                        children: <Widget>[
                                                            new Expanded(
                                                                child: new Text('aa'),
                                                            ),
                                                            new Text('bbb')
                                                        ],
                                                    )
                                                )
                                            ],
                                        ),
                                        decoration: new BoxDecoration(
                                            border: new Border(bottom: new BorderSide(
                                                color: Colors.grey,
                                            ))
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}