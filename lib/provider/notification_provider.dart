import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier{

  bool isOfflineChoosen = true;

  void setIsOfflineChoosen(bool value){
    isOfflineChoosen = value;
    notifyListeners();
  }

}