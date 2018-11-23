import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class PurifySoul extends StatefulWidget {
    static const String MK_ROUTER = 'purifySoul';
    
    @override
    _PurifySoulState createState() => _PurifySoulState();
}

class AnimatedLogo extends AnimatedWidget {
    
    AnimatedLogo({ Key key, Animation<double> animation }) : super( key: key, listenable: animation);

    Widget build(BuildContext contex) {
        final Animation<double> animation = listenable;
        return new Center(
            child: new Container(
                margin: new EdgeInsets.symmetric(vertical: 10.0),
                height: animation.value,
                width: animation.value,
                child: new FlutterLogo(),
            ),
        );
    }
}

class _PurifySoulState extends State<PurifySoul> with SingleTickerProviderStateMixin {
    
    Animation<double> animation;
    AnimationController controller;

    @override
    void initState() {
        controller = new AnimationController(
            duration: const Duration(milliseconds: 3000),
            vsync: this
        );
        animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
        animation.addStatusListener((status) {
            if (status == AnimationStatus.completed) {
                controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
                controller.forward();
            }
        });
        // ..addListener(() {
        //     setState(() {

        //     });
        // });
        controller.forward();
        super.initState();
    }

    @override
    void dispose() {
        controller.dispose();
        super.dispose();
      }

    @override
    Widget build(BuildContext context) {
        return new Material(
            child: new Scaffold(
                appBar: new AppBar(
                    title: new Text('测试'),
                ),
                body: new Center(
                    child: new Container(
                        // margin: EdgeInsets.symmetric(vertical: 10.0),
                        // height: animation.value,
                        // width: animation.value,
                        // child: new AnimatedLogo(animation: animation),
                        child: new AnimatedLogo(animation: animation),
                    ),
                ),
            ),
        );
    }
}
