import 'package:capstone_alterra_flutter/screen/main/widget/homepage_screen.dart';
import 'package:capstone_alterra_flutter/screen/main/widget/class_screen.dart';
import 'package:capstone_alterra_flutter/screen/main/widget/trainers_screen.dart';
import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier{
  int index = 0;

  List<Widget> listPage = [
    const HomepageScreen(),
    const TrainersScreen(),
    const ClassScreen(),
    const SizedBox()
  ];

  void setIndex(int value){
    index = value;
    notifyListeners();
  }
}