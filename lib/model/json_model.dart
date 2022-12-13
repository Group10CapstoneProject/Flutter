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

    var data = (json['data'] as List).map((e) => e as Map<String, dynamic>).toList();

    return JSONModel(
      data: data as T,
      message: json['message'],
      statusCode: statusCode,
    );
  }

}