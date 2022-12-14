import 'package:capstone_alterra_flutter/model/offline_model.dart';
import 'package:capstone_alterra_flutter/service/offline_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OfflineProvider with ChangeNotifier {
  OfflineService service = OfflineService();

  OfflineModel _offlineModel = OfflineModel();
  OfflineModel get offline => _offlineModel;

  Future<void> getOfflineClass(
      String time, int categoryId, String orderByPrice) async {
    try {
      final data =
          await service.getOfflineClass(time, categoryId, orderByPrice);
      _offlineModel = data!;
      // print(data.data!.offlineClasses![0].picture);
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
}
