import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier {
  bool isPromo = true;

  void setisPromo(bool value) {
    isPromo = value;
    notifyListeners();
  }
}
