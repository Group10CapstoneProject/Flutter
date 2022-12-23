import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/offline_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class OfflineService {
  final _dio = Dio();

  final String _endpoint = '${UserToken.serverEndpoint}/offline-classes';

  Future<JSONModel<List<OfflineModel>?>> getOfflineClass(
      String? time, int? categoryId, String? orderByPrice) async {
    
    String accessToken = UserToken.accessToken!;
      
    late final Response response;
    try {
      response = await _dio.get(_endpoint,
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
          }),
          queryParameters: {
            'time': time,
            'categoryId': categoryId,
            'orderByPrice': orderByPrice,
          });
      List<OfflineModel> listOffline = [];
      Map<String, dynamic> data = response.data['data'];
      List listKelas = data['offline_classes'];
      for (var element in listKelas) {
        listOffline.add(OfflineModel.fromJson(element as Map<String, dynamic>));
      }
      return JSONModel(
        data: listOffline,
        message: response.data['message'],
        statusCode: response.statusCode,
      );
    } on DioError catch (e) {
      if (e.response != null) {
        return JSONModel(
            message: e.response!.data['message'],
            statusCode: e.response!.statusCode);
      } else {
        return JSONModel(message: 'Unexpected error');
      }
    }
  }

  /// http://docs.rnwxyz.codes/#/Offline%20Classes/get_offline_classes_details__id_
  Future<JSONModel<OfflineModel>> getDetailOffline(int id) async {

    String accessToken = UserToken.accessToken!;
    late final Response response;
    try {
      response = await _dio.get(
        '$_endpoint/details/$id',
        options: Options(headers: {
          'Authorization': 'Bearer $accessToken',
        }),
      );
      return JSONModel(
        data: OfflineModel.fromJson(response.data['data']),
        message: response.data['message'],
        statusCode: response.statusCode,
      );
    } on DioError catch (e) {
      if (e.response != null) {
        return JSONModel(
            message: e.response!.data['message'],
            statusCode: e.response!.statusCode);
      } else {
        return JSONModel(message: 'Unexpected error');
      }
    }
  }
}
