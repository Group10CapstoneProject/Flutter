import 'package:capstone_alterra_flutter/model/offline_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class OfflineService {
  final _dio = Dio();

  final String _endpoint = '${UserToken.serverEndpoint}/offline-classes';

  String accessToken = UserToken.accessToken!;

  Future<OfflineModel?> getOfflineClass(
      String time, int categoryId, String orderByPrice) async {
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
      return OfflineModel.fromJson(response.data);
    } on DioError catch (e) {
      throw 'Error: $e';
    }
  }
}
