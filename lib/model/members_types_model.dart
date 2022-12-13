class MembersTypesModel{

  MembersTypesModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.picture,
    this.accessOfflineClass,
    this.accessOnlineClass,
    this.accessTrainer,
    this.accessGym,
  });


  final int? id;
  final String? name;
  final int? price;
  final String? description;
  final String? picture;
  final bool? accessOfflineClass;
  final bool? accessOnlineClass;
  final bool? accessTrainer;
  final bool? accessGym;

  factory MembersTypesModel.fromJSON({required Map<String, dynamic> json,}){

    return MembersTypesModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      picture: json['picture'],
      accessOfflineClass: json['access_offline_class'],
      accessOnlineClass: json['access_online_class'],
      accessTrainer: json['access_trainer'],
      accessGym: json['access_gym'],
    );
  }
}