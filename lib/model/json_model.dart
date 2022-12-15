class JSONModel<T>{

  JSONModel({
    this.data,
    this.message,
    this.statusCode,
  });

  final T? data;
  final String? message;
  final int? statusCode;

  factory JSONModel.fromJSON({required Map<String, dynamic> json, required int statusCode}){

    T? data = json['data'] as T?;

    return JSONModel(
      data: data,
      message: json['message'],
      statusCode: statusCode,
    );
  }

}