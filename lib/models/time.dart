import 'dart:async';
import 'package:flutter/material.dart';

TextEditingController timeController = TextEditingController();

String onlyTime = "";
getTime() {
  return (onlyTime =
      "${DateTime.now().hour > 12 ? DateTime.now().hour - 12 : DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}");
}

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        // Check mounted before calling setState...
        setState(() {
          getTime();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print("time widget init");
    return Center(
      child: Text(onlyTime,
          style: const TextStyle(
              color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold)),
    );
  }
}
