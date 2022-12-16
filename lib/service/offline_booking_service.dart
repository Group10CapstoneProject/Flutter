import 'dart:io';

import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/offline_class_booking_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class OfflineBookingService {
  final Dio _dio = Dio();

  final String _endpoint =
      '${UserToken.serverEndpoint}/offline-classes/bookings';

  Future<JSONModel<OfflineBookingModel>> offlineBookingTransaction({
    required int offlineClassId,
    required int paymentMethodId,
    required int total,
  }) async {
    final String accessToken = UserToken.accessToken!;

    late final Response response;
    try {
      response = await _dio.post(_endpoint,
          data: {
            'offline_class_id': offlineClassId,
            'payment_method_id': paymentMethodId,
            'total': total,
          },
          options: Options(contentType: Headers.jsonContentType, headers: {
            'Authorization': 'Bearer $accessToken',
          }));
      return JSONModel<OfflineBookingModel>(
        data: OfflineBookingModel.fromJSON(response.data['data']),
        message: response.data['message'],
        statusCode: response.statusCode,
      );
    } on DioError catch (e) {
      if (e.response != null) {
        return JSONModel(
          message: e.response!.data['message'],
          statusCode: e.response!.statusCode,
        );
      } else {
        return JSONModel(message: 'Unexpected error');
      }
    }
  }

  Future<JSONModel<dynamic>> offlineClassBookingPayment({
    required int bookingId,
    required File file,
  }) async {
    final String accessToken = UserToken.accessToken!;

    late final Response response;
    try {
      response = await _dio.post('$_endpoint/pay/$bookingId',
          options: Options(
            headers: {'Authorization': 'Bearer $accessToken'},
          ),
          data: FormData.fromMap({
            'file': await MultipartFile.fromFile(file.path,
                filename: file.uri.pathSegments.last)
          }));

      return JSONModel.fromJSON(
          json: response.data, statusCode: response.statusCode!);
    } on DioError catch (e) {
      if (e.response != null) {
        return JSONModel.fromJSON(
            json: e.response!.data, statusCode: e.response!.statusCode!);
      } else {
        return JSONModel(message: 'Unexpected error');
      }
    }
  }
}
