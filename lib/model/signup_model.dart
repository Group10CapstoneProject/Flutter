class SignupModel{

  SignupModel({
    this.message,
    this.statusCode,
  });

  final String? message;
  final int? statusCode;

  factory SignupModel.fromJSON({required Map<String, dynamic> json, int? statusCode}){
    return SignupModel(
      message: json['message'],
      statusCode: statusCode,
    );
  }
}