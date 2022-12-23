import 'package:capstone_alterra_flutter/model/articles_model.dart';
import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/offline_model.dart';
import 'package:capstone_alterra_flutter/service/articles_service.dart';
import 'package:capstone_alterra_flutter/service/offline_service.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:flutter/material.dart';

class HomepageProvider with ChangeNotifier{

  ///List of iklan
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




  ///List of offline class for today
  List<OfflineModel> listOffline = [];
  bool offlineIsLoading = false;
  OfflineService offlineService = OfflineService();
  
  Future<void> getOfflineClass() async {

    listOffline.clear();
    offlineIsLoading = true;
    notifyListeners();

    DateTime now = DateTime.now();
    String date = Utils.timeDate(now);
    JSONModel<List<OfflineModel>?> json = await offlineService.getOfflineClass(date, null, 'DESC');

    listOffline = json.data!;
    offlineIsLoading = false;
    notifyListeners();

  }










  ///List of article
  List<ArticlesModel> listArticle = [];
  bool articleIsLoading = false;

  ///to get all articles
  Future<void> getAllArticles() async {

    listArticle.clear();
    articleIsLoading = true;
    notifyListeners();

    ArticlesService articlesService = ArticlesService();

    JSONModel<List<ArticlesModel>> json = await articlesService.getAllArticles();

    if(json.statusCode == 200){
      listArticle.addAll(json.data!);
    }
    articleIsLoading = false;
    notifyListeners();
  }
}