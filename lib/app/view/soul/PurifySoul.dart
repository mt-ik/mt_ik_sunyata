import 'package:flutter/material.dart';
import 'package:mt_ik_sunyata/app/style/MKStyle.dart';
import 'package:mt_ik_sunyata/app/utils/CommonUtils.dart';

class PurifySoul extends StatefulWidget {
    static const String MK_ROUTER = 'purifySoul';
    
    @override
    _PurifySoulState createState() => _PurifySoulState();
}

class _PurifySoulState extends State<PurifySoul> {
    
    String _text = '111';

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
                                print(_text + '===========');
                                // Navigator.of(context).pop();
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
   
    @override
    Widget build(BuildContext context) {
        return new Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    new Expanded(
                        child: new TextField(
                            controller: controller,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.all(10.0),
                                hintText: '请开启灵魂对话',
                                border: InputBorder.none,
                            ),
                            maxLines: 100,
                            onChanged: onChanged,
                        ),
                    ),
                    new Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                        decoration: new BoxDecoration(
                            border: new Border(top: new BorderSide( width: 1.2, color: Colors.black87)),
                        ),
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                               new FlatButton(
                                  child: new Text('录音'),
                                  onPressed: () {

                                  },
                               ),
                               new RaisedButton(
                                  child: new Text('录像'),
                                  onPressed: () {

                                  },
                               )
                            ],
                        )
                    ),
                ],
            ),
        );
    }
}