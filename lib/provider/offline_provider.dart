import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/offline_model.dart';
import 'package:capstone_alterra_flutter/service/offline_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OfflineProvider with ChangeNotifier {
  OfflineService service = OfflineService();

  List<OfflineModel> _offlineModel = [];
  List<OfflineModel> get offline => _offlineModel;

  OfflineModel? _detailModel;
  OfflineModel? get detail => _detailModel;

  Future<void> getOfflineClass({
    required String time,
    required int categoryId,
    required String orderByPrice,
  }) async {
    try {
      final data =
          await service.getOfflineClass(time, categoryId, orderByPrice);
      _offlineModel = data.data!;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }

  // Future<void> getDetails(int id) async {
  //   print('2');
  //   try {
  //     final data = await service.getDetailOffline(id);
  //     _detailModel = data.data;
  //     // print(_detailModel.data!.id);
  //     notifyListeners();
  //   } catch (e) {
  //     if (e is DioError) {
  //       e.response!.statusCode;
  //     }
  //   }
  // }

  Future<JSONModel<OfflineModel>> getDetailsOffline(int id) async {
    JSONModel<OfflineModel> json = await service.getDetailOffline(id);
    notifyListeners();
    return json;
  }
}
