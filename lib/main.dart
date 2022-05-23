import 'package:flutter/material.dart';

import 'menu.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

void main() {
  runApp(const MyApp());
}

///Url to execute sttp requests..
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
