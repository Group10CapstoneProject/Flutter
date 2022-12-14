class OnlineClassCategoryModel{

  const OnlineClassCategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.picture,
    required this.onlineClassCount,
  });

  final int id;
  final String name;
  final String description;
  final String picture;
  final int onlineClassCount;

  factory OnlineClassCategoryModel.fromJSON(Map<String, dynamic> json){
    return OnlineClassCategoryModel(
      id: json['id'], 
      name: json['name'], 
      description: json['description'], 
      picture: json['picture'], 
      onlineClassCount: json['online_class_count'],
    );
  }

  
}