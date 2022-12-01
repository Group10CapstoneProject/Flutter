import 'package:flutter/material.dart';

class ClassProvider with ChangeNotifier{

  bool isOfflineChoosen = true;

  void setIsOfflineChoosen(bool value){
    isOfflineChoosen = value;
    notifyListeners();
  }

}