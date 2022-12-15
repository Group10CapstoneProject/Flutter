import 'package:capstone_alterra_flutter/model/online_class_model.dart';

class OnlineClassCategoryModel{

  const OnlineClassCategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.picture,
    required this.onlineClassCount,
    this.onlineClasses,
  });

  final int id;
  final String name;
  final String description;
  final String picture;
  final int onlineClassCount;
  final List<OnlineClassModel>? onlineClasses;

  factory OnlineClassCategoryModel.fromJSON(Map<String, dynamic> json){

    List<OnlineClassModel>? onlineClasses; 
    if(json['online_classes'] != null){
      List<Map<String, dynamic>> list = (json['online_classes'] as List).cast<Map<String, dynamic>>();
      onlineClasses = List.generate( 
        list.length, 
        (index) => OnlineClassModel.fromJSON(list[index]),
        growable: false,
      );
    } 

    return OnlineClassCategoryModel(
      id: json['id'], 
      name: json['name'], 
      description: json['description'], 
      picture: json['picture'], 
      onlineClassCount: json['online_class_count'],
      onlineClasses: onlineClasses,
    );
  }

  
}