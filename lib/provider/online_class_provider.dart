import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/online_class_category_model.dart';
import 'package:capstone_alterra_flutter/model/online_class_model.dart';
import 'package:capstone_alterra_flutter/service/online_class_category_service.dart';
import 'package:flutter/material.dart';

class OnlineClassProvider with ChangeNotifier{

  bool isLoading = false;
  List<OnlineClassCategoryModel> listOnlineCategory = [];
  OnlineClassCategoryService service = OnlineClassCategoryService();

  Future<void> getAllOnlineClassCategories() async{
    isLoading = true;
    listOnlineCategory.clear();
    notifyListeners();

    JSONModel<List<OnlineClassCategoryModel>?> json = await service.getAllOnlineClassCategories();
    if(json.statusCode == 200){
      listOnlineCategory = json.data!;
    }

    isLoading = false;
    notifyListeners();
  }



  Future<JSONModel<OnlineClassCategoryModel>> getSingleOrDetailOnlineClassCategory(int id) async{
    isLoading = true;
    notifyListeners();
    JSONModel<OnlineClassCategoryModel> json = await service.getSingleOrDetailOnlineClassCategory(id);
    isLoading = false;
    notifyListeners();
    return json;
  }


}