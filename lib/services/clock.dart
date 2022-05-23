import 'package:flutter/material.dart';

import '../models/time.dart';

class ClockPage extends StatelessWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print("clock build init");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clock"),
        centerTitle: true,
      ),
      body: const Center(child: Time()),

      ///time.dart called here as value comes from that widget
    );
  }
}
