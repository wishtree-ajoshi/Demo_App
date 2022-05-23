import 'package:flutter/material.dart';
import 'package:post_http_demo/methods/post.dart';
import 'package:post_http_demo/services/clock.dart';
import 'package:post_http_demo/services/provider_time.dart';
import 'package:provider/provider.dart';

import 'methods/get.dart';
import 'models/provider_time_model.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print("Menu Build Init");
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          children: [
            /// PostData method called...
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PostData(),
                      ));
                },
                child: const Text("Post")),

            /// GetData method called...
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GetData(),
                      ));
                },
                child: const Text("Get")),

            /// PutData method is called...
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PostData(),
                      ));
                },
                child: const Text("Put")),

            /// Clock using setState widget is called...
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ClockPage(),
                      ));
                },
                child: const Text("Clock")),

            /// Clock using Provider is called...
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(

                            ///ChangeNotifier builder made here so that it can be used anywhere in child widget
                            create: (BuildContext context) => ClockData(),
                            child: const ProviderClock()),
                      ));
                },
                child: const Text("Clock-Provider")),
          ],
        )),
      ),
    );
  }
}
