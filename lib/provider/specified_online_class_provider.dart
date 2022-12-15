import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/online_class_model.dart';
import 'package:capstone_alterra_flutter/service/online_classes_service.dart';
import 'package:flutter/material.dart';

class SpecifiedOnlineClassProvider with ChangeNotifier{
  
  bool isLoading = false;

  final OnlineClassesService _onlineClassesService = OnlineClassesService();

  Future<JSONModel<OnlineClassModel>> getSingleOrDetailOnlineClass(int id) async{
    isLoading = true;
    notifyListeners();

    JSONModel<OnlineClassModel> json = await _onlineClassesService.getSingleOrDetailOnlineClass(id);

    isLoading = false;
    notifyListeners();

    return json;
  }

}