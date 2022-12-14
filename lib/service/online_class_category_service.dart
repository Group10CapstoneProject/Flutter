import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/online_class_category_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class OnlineClassCategoryService{

  final Dio _dio = Dio();

  final  String _endpoint = '${UserToken.serverEndpoint}/online-classes/categories';

  Future<JSONModel<List<OnlineClassCategoryModel>?>> getAllOnlineClassCategories() async{
    final String accessToken = UserToken.accessToken!;

    late final Response response;
    try{
      response = await _dio.get(
        _endpoint,
        options: Options(
          headers: {
            'Authorization' : 'Bearer $accessToken'
          }
        )
      );

      JSONModel<List> json = JSONModel.fromJSON(json: response.data, statusCode: response.statusCode!);
      List<OnlineClassCategoryModel> listOnlineCategory = [];
      json.data?.forEach((element) {
        listOnlineCategory.add(OnlineClassCategoryModel.fromJSON(element as Map<String, dynamic>));
      });
      
      return JSONModel<List<OnlineClassCategoryModel>>(
        data: listOnlineCategory,
        message: json.message,
        statusCode: json.statusCode,
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