import 'package:flutter/material.dart';
import 'package:mt_ik_sunyata/app/view/origin/origin/chat/ChatList.dart';
import 'package:mt_ik_sunyata/app/view/origin/origin/address-book/AddressBook.dart';
class Origin extends StatefulWidget {

    @override
    _OriginState createState() => new _OriginState();

}

class _OriginState extends State<Origin> {

    @override
    Widget build(BuildContext context) {
        return new DefaultTabController(
            length: 3,
            child: new Scaffold(
                appBar: new AppBar(
                    title: new Text('缘起缘灭'),
                    bottom: new TabBar(
                        indicatorColor: new Color(0xFF63FDD9),
                        labelColor: new Color(0xFF63FDD9),
                        unselectedLabelColor: Colors.white,
                        tabs: <Widget>[
                            new Tab(text: '会话'),
                            new Tab(text: '通讯'),
                            new Tab(text: '发现'),
                        ],
                    ),
                ),
                body: new TabBarView(
                    children: <Widget>[
                        new ChatList(),
                        new AddressBook(),
                        new ChatList(),
                    ],
                )
            )
        );
    }
}