import 'package:capstone_alterra_flutter/model/offline_class_booking_model.dart';
import 'package:capstone_alterra_flutter/service/offline_booking_service.dart';
import 'package:capstone_alterra_flutter/util/state_enum.dart';
import 'package:flutter/material.dart';

class KodeBookingProvider with ChangeNotifier {
  OfflineBookingService offlineService = OfflineBookingService();

  OfflineBookingModel? _offlineBooking;
  OfflineBookingModel? get offlines => _offlineBooking;

  RequestState myState = RequestState.none;

  Future<void> offlineBookingDetails({required int id}) async {
    try {
      myState = RequestState.loading;
      notifyListeners();
      final data = await offlineService.offlineBookingDetails(id);
      _offlineBooking = data.data!;

      myState = RequestState.loaded;
      notifyListeners();
    } catch (e) {
      myState = RequestState.error;
      notifyListeners();
    }
  }
}
