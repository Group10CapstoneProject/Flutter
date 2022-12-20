import 'package:capstone_alterra_flutter/model/articles_model.dart';
import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/service/articles_service.dart';
import 'package:flutter/material.dart';

class ArticleProvider with ChangeNotifier{

  bool isLoading = false;
  ArticlesService articlesService = ArticlesService();
  ArticlesModel? articlesModel;

  Future<void> getSingleOrDetailArticle(int id) async{
    isLoading = true;
    notifyListeners();

    JSONModel<ArticlesModel> json = await articlesService.getSingleOrDetailArticle(id);
    if (json.statusCode == 200){
      articlesModel = json.data;
    }

    isLoading = false;
    notifyListeners();
  }
  

}