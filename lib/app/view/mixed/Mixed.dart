import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Mixed extends StatefulWidget {

    @override
    _MixedState createState() => new _MixedState();

}

class _MixedState extends State<Mixed> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(
                title: new Text('事上练'),
            ),
            body: Stack(
                children: <Widget>[
                    // new Center(child: CircularProgressIndicator()),
                    // new Center(
                    //     child: FadeInImage.memoryNetwork(
                    //         placeholder: kTransparentImage,
                    //         image:
                    //             'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                    //     ),
                    // ),
                    new Center(
                        child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/loading.gif',
                            image:
                                'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                        ),
                    ),
                ],
            ),
        );
    }
}