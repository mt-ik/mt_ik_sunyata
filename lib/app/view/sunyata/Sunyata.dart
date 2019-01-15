import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

class Sunyata extends StatefulWidget {

  @override
  _SunyataState createState() => new _SunyataState();

}

class _SunyataState extends State<Sunyata> {

  static getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    print('Running on ${iosInfo.utsname.sysname} ${iosInfo.utsname.version}');
  }
  
  @override
    void initState() {
      getDeviceInfo();
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('测试'),
            backgroundColor: Theme.of(context).primaryColor,
        ),
        body: new Center(
            child: new Text('测试'),
        ),
    );
  }

}