import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mt_ik_sunyata/app/redux/MKState.dart';
import 'package:mt_ik_sunyata/app/model/User.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:mt_ik_sunyata/app/view/Welcome.dart';
import 'package:mt_ik_sunyata/app/view/Login.dart';
import 'package:mt_ik_sunyata/app/view/Home.dart';
import 'package:mt_ik_sunyata/app/style/MKStyle.dart';
import 'package:mt_ik_sunyata/app/localization/MKLocalizationsDelegate.dart';

void main() {
    /// app主入口
    runApp(new MTIKSunyata());
    /**
     * Flutter中ImageCache缓存的是ImageStream对象, 也就是缓存的是一个异步加载的图片的对象
     * 在图片加载解码完成之前, 无法知道到底将要消耗多少内存
     * 所以容易产生大量的IO操作, 导致内存峰值过高
     */
    PaintingBinding.instance.imageCache.maximumSize = 100; /// 图片缓存个数限制
    PaintingBinding.instance.imageCache.maximumSizeBytes = 50 << 20; /// 图片缓存大小50M
}

class MTIKSunyata extends StatelessWidget {
    /// 初始化全局Store状态
    final store = new Store<MKState>(
        appReducer,
        initialState: new MKState(
            user: User.empty(),
            themeData: new ThemeData(
                primarySwatch: MKColors.primarySwatch,
                platform: TargetPlatform.iOS ///滑动返回
            ),
            locale: Locale('zh', 'CH'),
        )
    );

    MTIKSunyata({Key key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return new StoreProvider(
            store: store,
            child: new StoreBuilder<MKState>(builder: (context, store) {
                return new MaterialApp(
                    title: 'MT.IK.Sunyata',
                    ///多语言实现代理
                    localizationsDelegates: [
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        MKLocalizationsDelegate.delegate,
                    ],
                    locale: store.state.locale,
                    supportedLocales: [store.state.locale],
                    theme: store.state.themeData,
                    routes: {
                        Welcome.MK_ROUTER: (context) {
                            store.state.platformLocale = Localizations.localeOf(context);
                            return new Welcome();
                        },
                        Home.MK_ROUTER: (context) {
                            return new Home();
                        },
                        Login.MK_ROUTER: (context) {
                            return new Login();
                        }
                    },
                );
            }),
        );
    }
}

class SunyataApp extends StatefulWidget {
 SunyataApp({Key key}) : super(key: key);

 @override
 _SunyataAppState createState() => _SunyataAppState();
}

class _SunyataAppState extends State<SunyataApp> {
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Index 0: 首页'),
    Text('Index 1: 年/表'),
    new SelectionButton(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Sunyata Menu',
          onPressed: () {
            print('我是Menu');
          },
        ),
        title: Text('Sunyata'),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              print('我是Searching');
            },
          ),
        ],
      ),
      body: new Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('表')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('我')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.black87,
        onTap: _onItemTapped,
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: () {
          print('哈哈， 我执行了');
        }
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: new Text('Pick an option, any option!'),
    );
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop!
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that will complete after we call
    // Navigator.pop on the Selection Screen!
    final result = await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new SelectionScreen()),
    );

    // After the Selection Screen returns a result, show it in a Snackbar!
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text("$result")));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Pick an option'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: () {
                  // Close the screen and return "Yep!" as the result
                  Navigator.pop(context, 'Yep!');
                },
                child: new Text('Yep!'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: () {
                  // Close the screen and return "Nope!" as the result
                  Navigator.pop(context, 'Nope.');
                },
                child: new Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}