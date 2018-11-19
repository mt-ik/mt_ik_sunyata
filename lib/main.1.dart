import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = new Dio();

Future<Post> fetchPost() async {
  print('object========');
  Response response;
  response = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
  print(response);
  // final responseJson = response;
  return new Post.fromJson(response.data.body);
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  Post({this.userId, this.id, this.title, this.body });
  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fetch Data Example',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Center(
        child: new Text(
          'Hello, world!',
          textDirection: TextDirection.ltr,
        ),
      ),
      // home: new Scaffold(
      //   appBar: new AppBar(
      //     title: new Text('Fetch Data Example'),
      //   ),
      //   body: new Center(
      //     child: new FutureBuilder<Post>(
      //       future: fetchPost(),
      //       builder: (context, snapshot) {
      //         if (snapshot.hasData) {
      //           return new Text(snapshot.data.title);
      //         } else if (snapshot.hasError) {
      //           return new Text("${snapshot.error}");
      //         }

      //         // By default, show a loading spinner
      //         return new CircularProgressIndicator();
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}