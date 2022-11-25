class AuthModel{

  AuthModel({
    this.message,
    this.accessToken,
    this.refreshToken,
    this.statusCode,
  });

  final String? message;
  final String? accessToken;
  final String? refreshToken;
  final int? statusCode;

  factory AuthModel.fromJSON({required Map<String, dynamic> json, int? statusCode}){

    Map<String, dynamic>? data = json['data'];

    return AuthModel(
      message: json['message'],
      accessToken: data?['access_token'],
      refreshToken: data?['refresh_token'],
      statusCode: statusCode,
    );
  }

}