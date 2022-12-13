import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/members_types_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class MembersTypesService{

  final Dio _dio = Dio();

  final  String _endpoint = '${UserToken.serverEndpoint}/members/types';

  ///http://docs.rnwxyz.codes/#/Member%20Types/get_members_types
  Future<JSONModel<List<MembersTypesModel>?>> getAllMemberType() async{

    final String accessToken = UserToken.accessToken!;

    late final Response response;
    try{
      response = await _dio.get(
        _endpoint,
        options: Options(
          headers: {
            'Authorization' : 'Bearer $accessToken'
          }
        ),
      );

      // JSONModel<List<Map<String, dynamic>>> json = JSONModel.fromJSON(json: response.data, statusCode: response.statusCode!);
      JSONModel<List> json = JSONModel.fromJSON(json: response.data, statusCode: response.statusCode!);
      List<MembersTypesModel> listMembersType = [];
      json.data?.forEach((element) {
        listMembersType.add(MembersTypesModel.fromJSON(json: element as Map<String, dynamic>));
      });

      return JSONModel(
        data: listMembersType,
        message: json.message,
        statusCode: json.statusCode,
      );

    }
    on DioError catch(e){
      if(e.response != null){
        try{
          JSONModel<List<Map<String, dynamic>>> json = JSONModel.fromJSON(json: response.data, statusCode: response.statusCode!);
          return JSONModel<List<MembersTypesModel>>(message: json.message, statusCode: e.response!.statusCode!);
        }
        catch(e){
          return JSONModel<List<MembersTypesModel>>(message: 'Unexpected error');
        }
      }
      else{
        return JSONModel<List<MembersTypesModel>>(message: 'Unexpected error');
      }
    }
  }
}