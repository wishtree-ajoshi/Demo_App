import 'package:flutter/cupertino.dart';

///ChangeNotifier used here from Provider library...

class ClockData extends ChangeNotifier {
  ///getTime updates onlyTime when it is called...
  String onlyTime = "";
  String getTime() => onlyTime;

  currentTime() {
    /// Current time is being stored in onlyTime...
    onlyTime =
        "${DateTime.now().hour > 12 ? DateTime.now().hour - 12 : DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
    notifyListeners();
  }
}
