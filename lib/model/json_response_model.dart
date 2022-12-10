class JSONResponseModel<T>{

  JSONResponseModel({
    this.data,
    this.message,
    this.statusCode,
  });

  final T? data;
  final String? message;
  final int? statusCode;

  factory JSONResponseModel.fromJSON(Map<String, dynamic> json){
    return JSONResponseModel(
      data: json['data'],
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }

}