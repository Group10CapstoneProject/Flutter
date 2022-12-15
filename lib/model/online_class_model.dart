class OnlineClassModel{

  OnlineClassModel({
    required this.id,
    required this.title,
    required this.price,
    required this.duration,
    required this.level,
    this.picture,
    this.onlineClassCategoryId,
  });

  final int id;
  final String title;
  final int price;
  final int duration;
  final String level;
  final String? picture;
  final int? onlineClassCategoryId;

  factory OnlineClassModel.fromJSON(Map<String, dynamic> json){
    return OnlineClassModel(
      id: json['id'], 
      title: json['title'], 
      price: json['price'], 
      duration: json['duration'], 
      level: json['level'],
      picture: json['picture'],
      onlineClassCategoryId: json['online_class_category_id'],
    );
  }

}