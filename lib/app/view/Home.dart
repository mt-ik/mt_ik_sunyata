import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const String MK_ROUTER = 'home';

  /// 单击提示推出
  Future<bool> _dialogExitApp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        content: new Text('确定要退出应用？'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false), 
            child: new Text('取消')
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('确定'),
          ),
        ],
      )
    );
  }
  
  _renderTab(icon, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Icon(icon, size: 16.0), new Text(text)],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(Icons.home, '首页'),
      _renderTab(Icons.business, '年/表'),
      _renderTab(Icons.school, '我'),
    ];
    return WillPopScope(
      onWillPop: () {
        return _dialogExitApp(context);
      },
      child: new Text('ssssdddd')
    );
  }
}