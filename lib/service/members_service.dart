import 'dart:io';

import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/members_detail_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class MembersService{

  final Dio _dio = Dio();

  final  String _endpoint = '${UserToken.serverEndpoint}/members';

  ///http://docs.rnwxyz.codes/#/Members/post_members
  Future<JSONModel<MembersDetailModel>> createNewMembersOrBooking({
    required int memberTypeId,
    required int duration,
    required int paymentMethodId,
    required int total,
  }) async{

    final String accessToken = UserToken.accessToken!;

    late final Response response;
    try{
      response = await _dio.post(
        _endpoint,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            'Authorization' : 'Bearer $accessToken'
          },
        ),
        data: {
          'member_type_id' : memberTypeId,
          'duration' : duration,
          'payment_method_id' : paymentMethodId,
          'total' : total,
        }
      );
      JSONModel<Map<String, dynamic>> json = JSONModel.fromJSON(json: response.data, statusCode: response.statusCode!);
      
      return JSONModel<MembersDetailModel>(
        data: MembersDetailModel.fromJSON(json.data!), 
        message: json.message,
        statusCode: json.statusCode!
      );
    }
    on DioError catch(e){
      if(e.response != null){
        return JSONModel(message: e.response!.data['message'], statusCode: e.response!.statusCode!);
      }
      else{
        return JSONModel(message: 'Unexpected error');
      }
    }
  }

  ///http://docs.rnwxyz.codes/#/Members/post_members_pay__id_
  Future<JSONModel<dynamic>> uploadProofOfMembershipPayment({
    required int bookingId,
    required File file,
  }) async{

    final String accessToken = UserToken.accessToken!;

    late final Response response;
    try{
      response = await _dio.post(
        '$_endpoint/pay/$bookingId',
        options: Options(
          headers: {
            'Authorization' : 'Bearer $accessToken'
          },
        ),
        data: FormData.fromMap({
          'file' : await MultipartFile.fromFile(file.path, filename: file.uri.pathSegments.last)
        })
      );

      return JSONModel.fromJSON(json: response.data, statusCode: response.statusCode!);
    }
    on DioError catch(e){
      if(e.response != null){
        return JSONModel.fromJSON(json: e.response!.data, statusCode: e.response!.statusCode!);
      }
      else{
        return JSONModel(message: 'Unexpected error');
      }
    }
  }

  ///http://docs.rnwxyz.codes/#/Members/get_members_user
  Future<JSONModel<MembersDetailModel>> getUserMemberHistory() async{

    final String accessToken = UserToken.accessToken!;

    late final Response response;
    try{
      response = await _dio.get(
        '$_endpoint/user',
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            'Authorization' : 'Bearer $accessToken'
          },
        ),
      );
      JSONModel<Map<String, dynamic>> json = JSONModel.fromJSON(json: response.data, statusCode: response.statusCode!);
      
      return JSONModel<MembersDetailModel>(
        data: MembersDetailModel.fromJSON(json.data!), 
        message: json.message,
        statusCode: json.statusCode!
      );
    }
    on DioError catch(e){
      if(e.response != null){
        return JSONModel(message: e.response!.data['message'], statusCode: e.response!.statusCode!);
      }
      else{
        return JSONModel(message: 'Unexpected error');
      }
    }
  }
}