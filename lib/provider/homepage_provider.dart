import 'package:flutter/material.dart';

class HomepageProvider with ChangeNotifier{

  List<String> listIklan = [];
  double iklanIndex = 0;

  void nextIklan(){
    iklanIndex += 1;
    if(iklanIndex == listIklan.length){
      iklanIndex = 0;
    }
    
    notifyListeners();
  }

  void changeIklan(double value){
    iklanIndex = value;
    notifyListeners();
  }
}