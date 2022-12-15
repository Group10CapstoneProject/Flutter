import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/online_class_category_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class OnlineClassCategoryService{

  final Dio _dio = Dio();

  final  String _endpoint = '${UserToken.serverEndpoint}/online-classes/categories';

  ///http://docs.rnwxyz.codes/#/Online%20Class%20Categories/get_online_classes_categories
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




  ///http://docs.rnwxyz.codes/#/Online%20Class%20Categories/get_online_classes_categories_details__id_
  Future<JSONModel<OnlineClassCategoryModel>> getSingleOrDetailOnlineClassCategory(int id) async{
    final String accessToken = UserToken.accessToken!;

    late final Response response;
    try{
      response = await _dio.get(
        '$_endpoint/details/$id',
        options: Options(
          headers: {
            'Authorization' : 'Bearer $accessToken'
          }
        )
      );

      OnlineClassCategoryModel onlineClassCategoryModel = OnlineClassCategoryModel.fromJSON(response.data['data']);
      return JSONModel<OnlineClassCategoryModel>(
        data: onlineClassCategoryModel, 
        message: response.data['message'],
        statusCode: response.statusCode!
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