import 'package:capstone_alterra_flutter/model/articles_model.dart';
import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class ArticlesService{

  final Dio _dio = Dio();

  final  String _endpoint = '${UserToken.serverEndpoint}/articles';

  ///http://docs.rnwxyz.codes/#/Articles/get_articles
  Future<JSONModel<List<ArticlesModel>>> getAllArticles() async{
    
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

      List<dynamic> list = response.data['data'];

      return JSONModel(
        data: List.generate(list.length, (index) => ArticlesModel.fromJSON(list[index])),
        message: response.data['message'],
        statusCode: response.statusCode,
      );
    }
    on DioError catch(e){
      if(e.response != null){
        return JSONModel(message: e.response!.data['message'], statusCode: e.response!.statusCode);
      }
      else{
        return JSONModel(message: 'Unexpected Message');
      }
    }
  }

  ///http://docs.rnwxyz.codes/#/Articles/get_articles_details__id_
  Future<JSONModel<ArticlesModel>> getSingleOrDetailArticle(int id) async{
    
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

      return JSONModel(
        data: ArticlesModel.fromJSON(response.data['data']),
        message: response.data['message'],
        statusCode: response.statusCode,
      );
    }
    on DioError catch(e){
      if(e.response != null){
        return JSONModel(message: e.response!.data['message'], statusCode: e.response!.statusCode);
      }
      else{
        return JSONModel(message: 'Unexpected Message');
      }
    }
  }

}