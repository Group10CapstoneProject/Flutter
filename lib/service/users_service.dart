import 'package:capstone_alterra_flutter/model/signup_model.dart';
import 'package:capstone_alterra_flutter/model/user_profile_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class UsersService{

  final _dio = Dio();

  final String _endpoint = '${UserToken.serverEndpoint}/users';

  ///http://docs.rnwxyz.codes/#/Users/post_users_signup
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
        try{
          return SignupModel.fromJSON(json: e.response!.data, statusCode: e.response!.statusCode);
        }
        catch(e){
          return SignupModel(message: 'Unexpected error');
        }
      }
      else{
        return SignupModel(message: 'Unexpected error');
      }
    }
  }



  ///http://docs.rnwxyz.codes/#/Users/get_users_profile
  Future<UserProfileModel> getUserProfile() async{

    String accessToken = UserToken.accessToken!;

    late final Response response;
    try{
      response = await _dio.get(
        '$_endpoint/profile',
        options: Options(
          headers: {
            'Authorization' : 'Bearer $accessToken',
          }
        )
      );
      return UserProfileModel.fromJSON(json: response.data, statusCode: response.statusCode);
    }
    on DioError catch(e){
      if(e.response != null){
        try{
          return UserProfileModel.fromJSON(json: e.response!.data, statusCode: e.response!.statusCode);
        }
        catch(e){
          return UserProfileModel(message: 'Unexpected error');
        }
      }
      else{
        return UserProfileModel(message: 'Unexpected error');
      }
    }
  }
}