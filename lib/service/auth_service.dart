import 'package:capstone_alterra_flutter/model/auth_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class AuthService{

  final Dio _dio =  Dio();

  final String _endpoint = '${UserToken.serverEndpoint}/auth';

  Future<AuthModel> postLoginUser({required String email, required String password}) async{

    late final Response response;
    try{
      response = await _dio.post(
        '$_endpoint/login',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: {
          'email' : email,
          'password' : password,
        }
      );
      return AuthModel.fromJSON(json: response.data, statusCode: response.statusCode);
    }
    on DioError catch(e){
      if(e.response != null){
        try{
          return AuthModel.fromJSON(json: e.response?.data, statusCode: e.response?.statusCode);
        }
        catch(e){
          return AuthModel(message: 'Unexpected error');
        }
      }
      else{
        return AuthModel(message: 'Unexpected error');
      }
    }
  }

  Future<AuthModel> postGenerateNewToken({required String refreshToken}) async{

    late final Response response;
    try{
      response = await _dio.post(
        '$_endpoint/refresh',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: {
          'refresh_token' : refreshToken
        }
      );
      return AuthModel.fromJSON(json: response.data, statusCode: response.statusCode);
    }
    on DioError catch(e){
      if(e.response != null){
        try{
          return AuthModel.fromJSON(json: e.response?.data, statusCode: e.response?.statusCode);
        }
        catch(e){
          return AuthModel(message: 'Unexpected error');
        }
      }
      else{
        return AuthModel(message: 'Unexpected error');
      }
    }
  }
}