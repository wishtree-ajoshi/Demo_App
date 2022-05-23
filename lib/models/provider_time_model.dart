import 'package:flutter/cupertino.dart';

///ChangeNotifier used here from Provider library...

class ClockData extends ChangeNotifier {
  String onlyTime = "";

  String getTime() => onlyTime;

  currentTime() {
    onlyTime =
        "${DateTime.now().hour > 12 ? DateTime.now().hour - 12 : DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
    notifyListeners();
  }
}
