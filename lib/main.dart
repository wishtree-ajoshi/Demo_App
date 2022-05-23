import 'package:flutter/material.dart';
import 'package:post_http_demo/methods/post.dart';
import 'package:post_http_demo/models/provider_time_model.dart';
import 'package:post_http_demo/services/clock.dart';
import 'package:post_http_demo/services/provider_time.dart';
import 'package:provider/provider.dart';

import 'menu.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

void main() {
  runApp(const MyApp());
}

String url = 'https://jsonplaceholder.typicode.com/albums';

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //print("Main build init");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo for post method',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Menu(),
    );
  }
}
