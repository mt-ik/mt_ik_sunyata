import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
    
    @override
    _ChatListState createState() => new _ChatListState();
}

class _ChatListState extends State<ChatList> {
    @override
    Widget build(BuildContext context) {
        return new Container(
            child: new Container(
                child: new Column(
                    children: <Widget>[
                        new Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                            child: new Row(
                                children: <Widget>[
                                    new Container(
                                        margin: EdgeInsets.only(right: 10.0),
                                        width: 50,
                                        height: 50,
                                        child: new Image(
                                            height: 50,
                                            width: 50,
                                            image: new AssetImage('assets/sunyata/mt_ik_tx.jpg'), 
                                            fit: BoxFit.cover
                                        ),
                                    ),
                                    new Expanded(
                                        child: new Container(
                                            height: 50,
                                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                            child: new Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                    new Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                            new Expanded(
                                                                child: new Text('title'),
                                                            ),
                                                            new Text('time')
                                                        ],
                                                    ),
                                                ],
                                            ),
                                            // child: new Column(
                                            //     children: <Widget>[
                                                    // new Row(
                                                    //     children: <Widget>[
                                                    //         new Expanded(
                                                    //             child: new Text('msg'),
                                                    //         ),
                                                            
                                                    //         new Text('icon')
                                                    //     ],
                                                    // )
                                                // ],
                                            // ),
                                            decoration: new BoxDecoration(
                                                border: new Border(bottom: new BorderSide())
                                            ),
                                        ),
                                    ),
                                    new Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 50,
                                        child: new Column(
                                            children: <Widget>[
                                                new Expanded(
                                                    child: new Text('title'),
                                                ),
                                                new Text('time')
                                            ],
                                        )
                                    )
                                ],
                            ),
                        ),
                        new Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                            child: new Row(
                                children: <Widget>[
                                    new Container(
                                        margin: EdgeInsets.only(right: 10.0),
                                        width: 50,
                                        height: 50,
                                        child: new Image(
                                            height: 50,
                                            width: 50,
                                            image: new AssetImage('assets/sunyata/mt_ik_tx.jpg'), 
                                            fit: BoxFit.cover
                                        ),
                                    ),
                                    new Expanded(
                                        child: new Container(
                                            height: 50,
                                            child: new Row(
                                                children: <Widget>[
                                                    new Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[
                                                            new Expanded(
                                                                child: new Text('title'),
                                                            ),
                                                            new Text('time')
                                                        ],
                                                    ),
                                                ],
                                            ),
                                            // child: new Column(
                                            //     children: <Widget>[
                                                    // new Row(
                                                    //     children: <Widget>[
                                                    //         new Expanded(
                                                    //             child: new Text('msg'),
                                                    //         ),
                                                            
                                                    //         new Text('icon')
                                                    //     ],
                                                    // )
                                                // ],
                                            // ),
                                            decoration: new BoxDecoration(
                                                border: new Border(bottom: new BorderSide())
                                            ),
                                        ),
                                    ),
                                    new Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 50,
                                        child: new Column(
                                            children: <Widget>[
                                                new Expanded(
                                                    child: new Text('title'),
                                                ),
                                                new Text('time')
                                            ],
                                        )
                                    )
                                ],
                            ),
                        ),
                        new Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                            child: new Row(
                                children: <Widget>[
                                    new Container(
                                        margin: EdgeInsets.only(right: 10.0),
                                        width: 50,
                                        height: 50,
                                        child: new Image(
                                            height: 50,
                                            width: 50,
                                            image: new AssetImage('assets/sunyata/mt_ik_tx.jpg'), 
                                            fit: BoxFit.cover
                                        ),
                                    ),
                                    new Expanded(
                                        child: new Container(
                                            height: 50,
                                            child: new Row(
                                                children: <Widget>[
                                                    new Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[
                                                            new Expanded(
                                                                child: new Text('title'),
                                                            ),
                                                            new Text('time')
                                                        ],
                                                    ),
                                                ],
                                            ),
                                            // child: new Column(
                                            //     children: <Widget>[
                                                    // new Row(
                                                    //     children: <Widget>[
                                                    //         new Expanded(
                                                    //             child: new Text('msg'),
                                                    //         ),
                                                            
                                                    //         new Text('icon')
                                                    //     ],
                                                    // )
                                                // ],
                                            // ),
                                            decoration: new BoxDecoration(
                                                border: new Border(bottom: new BorderSide())
                                            ),
                                        ),
                                    ),
                                    new Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 50,
                                        child: new Column(
                                            children: <Widget>[
                                                new Expanded(
                                                    child: new Text('title'),
                                                ),
                                                new Text('time')
                                            ],
                                        )
                                    )
                                ],
                            ),
                        )
                    ],
                ),
            ),
        );
    }
}