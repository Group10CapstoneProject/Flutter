import 'package:capstone_alterra_flutter/model/articles_model.dart';
import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/service/articles_service.dart';
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




  List<ArticlesModel> listArticle = [];

  ///to get all articles
  Future<void> getAllArticles() async {

    listArticle.clear();
    notifyListeners();

    ArticlesService articlesService = ArticlesService();

    JSONModel<List<ArticlesModel>> json = await articlesService.getAllArticles();

    if(json.statusCode == 200){
      listArticle.addAll(json.data!);
    }
    notifyListeners();
  }
}