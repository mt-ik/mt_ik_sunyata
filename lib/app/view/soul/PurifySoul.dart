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
            print(_text);
            print(newText);
            _text = newText;          
        });
    }

    @override
    void initState() {
        super.initState();
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
                                Navigator.of(context).pop();
                            },
                        ),
                    ],
                ),
                body: new Center(
                    child: new Container(
                        child: new TextInput(
                            text: _text,
                            onChanged: handleTextChanged,
                        ),
                    ),
                ),
            ),
        );
    }
}

class TextInput extends StatefulWidget {
    TextInput({Key key,  this.text: '', this.onChanged}) : super(key:key);


    final String text;

    final ValueChanged<String> onChanged;

    void ininState() {
        print(this.onChanged);
    }

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
    void initState() {
        print(text);
        print(onChanged);
        super.initState();
    }
    @override
    Widget build(BuildContext context) {
        return new Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    new TextField(
                        controller: controller,
                        // decoration: new InputDecoration(
                        //     hintText: 'Type something',
                        // ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            icon: Icon(Icons.text_fields),
                            labelText: '请输入你的姓名)',
                            helperText: '请输入你的真实姓名',
                        ),
                        maxLines: 5,
                        maxLength: 20,
                    ),
                    new RaisedButton(
                        onPressed: () {
                            // showDialog(
                            //     context: context,
                            //     child: new AlertDialog(
                            //         title: new Text('What you typed'),
                            //         content: new Text(controller.text),
                            //     ),
                            // );
                            text = controller.text;
                            print(onChanged.toString());
                            onChanged(text);
                        },
                        child: new Text('DONE'),
                    ),
                ],
            ),
        );
    }
}