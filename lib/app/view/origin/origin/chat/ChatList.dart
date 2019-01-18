import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
    
    @override
    _ChatListState createState() => new _ChatListState();
}

class _ChatListState extends State<ChatList> {
    static getChatList() {
        List<Widget> list = [];
        for (var i = 0; i < 5; i++) {
            final chat = new FlatButton(
                onPressed: () {
                    print('object');
                },
                child: new Row(
                    children: <Widget>[
                        new Container(
                            padding: EdgeInsets.only(right: 10),
                            child: new ClipRRect(
                                child: new FadeInImage.assetNetwork(
                                    placeholder: 'assets/sunyata/mt_ik_tx.jpg',
                                    fit: BoxFit.cover,
                                    image: '',
                                    height: 50,
                                    width: 50,
                                ),
                                borderRadius: BorderRadius.circular(5.0)
                            )
                            // child: new ClipOval(
                            //     child: new FadeInImage.assetNetwork(
                            //         placeholder: 'assets/sunyata/mt_ik_tx.jpg',
                            //         fit: BoxFit.cover,
                            //         image: '',
                            //         height: 50,
                            //         width: 50,
                            //     )
                            // ),
                            // child: new Image(
                            //     height: 50,
                            //     width: 50,
                            //     image: new AssetImage('assets/sunyata/mt_ik_tx.jpg'),
                            // ),
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
                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: <Widget>[
                                                                new Text('title' + i.toString()),
                                                                new Text('time' + i.toString()),
                                                            ],
                                                        ),
                                                    ],
                                                ),
                                            ),
                                        ),
                                        new Container(
                                            margin: EdgeInsets.only(left: 10),
                                            width: 50,
                                            height: 60,
                                            child: new Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: <Widget>[
                                                    // new Expanded(
                                                        new Text('aa' + i.toString(), textAlign: TextAlign.right,),
                                                    // ),
                                                    // new Expanded(
                                                        new Text('bbb' + i.toString(), textAlign: TextAlign.right,)
                                                    // ),
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
            );
            list.add(chat);
        }
        return new Column(
            children: list
        );
    }

    @override
    Widget build(BuildContext context) {
        return new Container(
            child: new Column(
                children: <Widget>[ getChatList() ],
            ),
        );
    }
}