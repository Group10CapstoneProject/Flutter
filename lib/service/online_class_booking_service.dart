import 'dart:io';

import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/online_class_booking_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class OnlineClassBookingService{

  final Dio _dio = Dio();

  final  String _endpoint = '${UserToken.serverEndpoint}/online-classes/bookings';

  ///http://docs.rnwxyz.codes/#/Online%20Class%20Bookings/post_online_classes_bookings
  Future<JSONModel<OnlineClassBookingModel>> createNewOnlineClassBookingOrTransaction({
    required int onlineClassId,
    required int duration,
    required int paymentMethodId,
    required int total,
  }) async{
    final String accessToken = UserToken.accessToken!;

    late final Response response;
    try{
      response = await _dio.post(
        _endpoint,
        data: {
          'online_class_id' : onlineClassId,
          'duration' : duration,
          'payment_method_id' : paymentMethodId,
          'total' : total,
        },
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            'Authorization' : 'Bearer $accessToken'
          }
        )
      );

      return JSONModel<OnlineClassBookingModel>(
        data: OnlineClassBookingModel.fromJSON(response.data['data']),
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


  ///http://docs.rnwxyz.codes/#/Online%20Class%20Bookings/post_online_classes_bookings_pay__id_
  Future<JSONModel<dynamic>> uploadProofOfOnlineClassBookingPayment({
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

}