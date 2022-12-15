import 'package:capstone_alterra_flutter/model/online_class_category_model.dart';

class OnlineClassModel{

  OnlineClassModel({
    required this.id,
    required this.title,
    required this.price,
    required this.duration,
    required this.level,
    this.picture,
    this.onlineClassCategoryId,
    this.description,
    this.link,
    this.path,
    this.tools,
    this.targetArea,
    this.onlineClassCategory,
  });

  final int id;
  final String title;
  final int price;
  final int duration;
  final String level;
  final String? picture;
  final int? onlineClassCategoryId;
  final String? description;
  final String? link;
  final String? path;
  final String? tools;
  final String? targetArea;
  final OnlineClassCategoryModel? onlineClassCategory;

  factory OnlineClassModel.fromJSON(Map<String, dynamic> json){
    return OnlineClassModel(
      id: json['id'], 
      title: json['title'], 
      price: json['price'], 
      duration: json['duration'], 
      level: json['level'],
      picture: json['picture'],
      onlineClassCategoryId: json['online_class_category_id'],
      description: json['description'],
      link: json['link'],
      path: json['path'],
      tools: json['tools'],
      targetArea: json['target_area'],
      onlineClassCategory: (json['online_class_category'] != null) ? 
        OnlineClassCategoryModel.fromJSON(json['online_class_category']) : 
        null,
    );
  }

}