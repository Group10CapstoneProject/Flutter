class ArticlesModel{

  ArticlesModel({
    required this.id, 
    this.title, 
    this.picture, 
    this.content, 
    this.updatedAt
  });

  final int id;
  final String? title;
  final String? picture;
  final String? content;
  final String? updatedAt;

  factory ArticlesModel.fromJSON(Map<String, dynamic> json){
    return ArticlesModel(
      id: json['id'],
      title: json['title'],
      picture: json['picture'],
      content: json['content'],
      updatedAt: json['updated_at'],
    );
  }
}