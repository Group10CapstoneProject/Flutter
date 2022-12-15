import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/online_class_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class OnlineClassesService{

  final Dio _dio = Dio();

  final  String _endpoint = '${UserToken.serverEndpoint}/online-classes';

  Future<JSONModel<OnlineClassModel>> getSingleOrDetailOnlineClass(int id) async{
    final String accessToken = UserToken.accessToken!;

    late final Response response;
    try{
      response = await _dio.get(
        '$_endpoint/details/$id',
        options: Options(
          headers: {
            'Authorization' : 'Bearer $accessToken',
          }
        ),
      );
      return JSONModel<OnlineClassModel>(
        data: OnlineClassModel.fromJSON(response.data['data']),
        message: response.data['message'],
        statusCode: response.statusCode,
      );
    }
    on DioError catch(e){
      if(e.response != null){
        return JSONModel(message: e.response!.data['message'], statusCode: e.response!.statusCode);
      }
      else{
        return JSONModel(message: 'Unexpected error');
      }
    }
  }
}