import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier {
  bool isInfo = true;

  void setisInfo(bool value) {
    isInfo = value;
    notifyListeners();
  }
}
