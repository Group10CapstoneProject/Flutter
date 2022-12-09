class UserProfileModel{

  UserProfileModel({
    this.id,
    this.name,
    this.email,
    this.role,
    this.message,
    this.statusCode,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? role;
  final String? message;
  final int? statusCode;

  factory UserProfileModel.fromJSON({required  Map<String, dynamic> json, int? statusCode}){

    Map<String, dynamic> data = json['data'].cast<String, dynamic>();

    return UserProfileModel(
      id: data['id'], 
      name: data['name'], 
      email: data['email'], 
      role: data['role'],
      message: json['message'],
      statusCode: statusCode,
    );
  }
}