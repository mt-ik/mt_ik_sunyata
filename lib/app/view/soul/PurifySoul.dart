import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mt_ik_sunyata/app/style/MKStyle.dart';
import 'package:mt_ik_sunyata/app/utils/CommonUtils.dart';

class PurifySoul extends StatefulWidget {
    static const String MK_ROUTER = 'purifySoul';
    
    @override
    _PurifySoulState createState() => _PurifySoulState();
}

class _PurifySoulState extends State<PurifySoul> {
    
    String _text = '';

    void handleTextChanged(String newText) {
        setState(() {
            _text = newText;          
        });
    }

    @override
    void dispose() {
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return new Material(
            child: new Scaffold(
                appBar: new AppBar(
                    title: new Text(CommonUtils.getLocale(context).soulPurifyTitle),
                    centerTitle: false, // 标题居中: 默认true
                    leading: new IconButton(
                        icon: new Icon(Icons.close),
                        tooltip: 'close',
                        onPressed: () {
                            Navigator.of(context).pop();
                        },
                    ),
                    actions: <Widget>[
                        IconButton(
                            icon: Icon(MKICons.SOUL_SEND),
                            tooltip: 'send',
                            onPressed: () {
                                print(_text);
                                if (_text == '') {
                                    Fluttertoast.showToast(
                                        msg: "您还尚未开启对话哈",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIos: 2,
                                        bgcolor: "#63CA6C",
                                        textcolor: '#ffffff',
                                    );
                                    return false; 
                                }
                                Navigator.of(context).pop();
                            },
                        ),
                    ],
                ),
                body: new TextInput(
                    text: _text,
                    onChanged: handleTextChanged,
                ),
            ),
        );
    }
}

class TextInput extends StatefulWidget {
    TextInput({Key key,  this.text: '', this.onChanged}) : super(key:key);


    final String text;

    final ValueChanged<String> onChanged;

    @override
    _TextInputState createState() => new _TextInputState(text: text, onChanged: onChanged);
}

class _TextInputState extends State<TextInput> {

    @override
    _TextInputState({Key key, this.text: '', this.onChanged}) : super();

    String text;

    final ValueChanged<String> onChanged;

    final TextEditingController controller = new TextEditingController();
   
    String _bodyStr = "选项";
    @override
    Widget build(BuildContext context) {
        return new Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    new Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                new Text(_bodyStr),
                                new PopupMenuButton(
                                    onSelected: (String value) {
                                        setState(() {
                                            _bodyStr = value;                                      
                                        });
                                    },
                                    // initialValue: '选项一',
                                    itemBuilder: (BuildContext context) => <PopupMenuItem<String>> [
                                        new PopupMenuItem(
                                            value:"选项一",
                                            child: new Text("选项一")
                                        ),
                                        new PopupMenuItem(
                                            enabled: true,
                                            value: "选项二",
                                            child: new Text("选项二")
                                        ),
                                    ]
                                ),
                                new FlatButton(  
                                    // color: Colors.black87,
                                    textColor: Colors.black54,
                                    child: new Text('添加地点'),
                                    onPressed: () {

                                    },
                                ),
                            ],
                        ),
                    ),
                    new Expanded(
                        child: new TextField(
                            controller: controller,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                                hintText: '开启真实的自己',
                                border: InputBorder.none,
                            ),
                            maxLines: 100,
                            onChanged: onChanged,
                        ),
                    ),
                    new Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                new FlatButton(
                                    // color: Colors.black87,
                                    textColor: Colors.black54,
                                    child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                            new Icon(MKICons.GLOBAL_LOCATION, size: 20.0),
                                            new Text('定位')
                                        ],

                                    ),
                                    onPressed: () {

                                    },
                                ),
                            ],
                        ),
                    ),
                    new Container(
                        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 0, bottom: 5.0),
                        // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                        decoration: new BoxDecoration(
                            border: new Border(top: new BorderSide( width: 1.2, color: Colors.black87)),
                        ),
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                                new FlatButton(
                                    color: Colors.black87,
                                    textColor: Colors.white,
                                    highlightColor: Colors.green,
                                    disabledColor: Colors.grey,
                                    child: new Text('拍摄'),
                                    onPressed: () {

                                    },
                                ),
                                new RaisedButton(
                                    color: Colors.black87,
                                    textColor: Colors.white,
                                    highlightColor: Colors.green,
                                    disabledColor: Colors.grey,
                                    child: new Text('相册 / 视频'),
                                    onPressed: () {

                                    },
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}