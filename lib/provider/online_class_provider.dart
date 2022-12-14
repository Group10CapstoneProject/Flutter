import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/online_class_category_model.dart';
import 'package:capstone_alterra_flutter/service/online_class_category_service.dart';
import 'package:flutter/material.dart';

class OnlineClassProvider with ChangeNotifier{

  bool isLoading = false;
  List<OnlineClassCategoryModel> listOnlineCategory = [];
  OnlineClassCategoryService service = OnlineClassCategoryService();

  Future<void> getAllOnlineClassCategories() async{
    isLoading = true;
    notifyListeners();

    JSONModel<List<OnlineClassCategoryModel>?> json = await service.getAllOnlineClassCategories();
    if(json.statusCode == 200){
      listOnlineCategory = json.data!;
    }

    isLoading = false;
    notifyListeners();
  }

  void removeAllOnlineClassCategory(){
    listOnlineCategory.clear();
    notifyListeners();
  }


}