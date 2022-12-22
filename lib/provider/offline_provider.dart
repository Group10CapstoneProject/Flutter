import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/offline_model.dart';
import 'package:capstone_alterra_flutter/service/offline_service.dart';
import 'package:capstone_alterra_flutter/util/state_enum.dart';
import 'package:flutter/material.dart';

class OfflineProvider with ChangeNotifier {
  int swap = 0;

  OfflineService service = OfflineService();

  List<OfflineModel> _offlineModel = [];
  List<OfflineModel> get offline => _offlineModel;

  OfflineModel? _detailModel;
  OfflineModel? get detail => _detailModel;

  RequestState myState = RequestState.none;

  Future<void> getOfflineClass({
    required String time,
    required int categoryId,
    required String orderByPrice,
  }) async {
    try {
      myState = RequestState.loading;
      notifyListeners();
      final data =
          await service.getOfflineClass(time, categoryId, orderByPrice);
      _offlineModel = data.data!;
      myState = RequestState.loaded;
      notifyListeners();
    } catch (e) {
      myState = RequestState.error;
      notifyListeners();
    }
  }

  Future<JSONModel<OfflineModel>> getDetailsOffline(int id) async {
    JSONModel<OfflineModel> json = await service.getDetailOffline(id);
    return json;
  }

  void setSwap(int value) {
    swap = value;
    notifyListeners();
  }
}
