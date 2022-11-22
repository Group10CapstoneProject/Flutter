import 'package:capstone_alterra_flutter/screen/main/widget/homepage_screen.dart';
import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier{
  int index = 0;

  List<Widget> listPage = [
    const HomepageScreen(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox()
  ];

  void setIndex(int value){
    index = value;
    notifyListeners();
  }
}