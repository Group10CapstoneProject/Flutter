import 'package:capstone_alterra_flutter/model/signup_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class UsersService{

  final _dio = Dio();

  final String _endpoint = '${UserToken.serverEndpoint}/users';

  Future<SignupModel> postSignupNewUser({
    required String name,
    required String email,
    required String password,
  }) async{
    
    late final Response response;
    try{
      response = await _dio.post(
        '$_endpoint/signup',
        options: Options(
          contentType: Headers.jsonContentType
        ),
        data: {
          "name" : name,
          "email" : email,
          "password" : password,
        }
      );
      
      return SignupModel.fromJSON(json: response.data, statusCode: response.statusCode);
    }
    on DioError catch(e){
      if(e.response != null){
        return SignupModel.fromJSON(json: e.response!.data, statusCode: e.response!.statusCode);
      }
      else{
        return SignupModel(message: 'Unexpected error');
      }
    }
  }
}