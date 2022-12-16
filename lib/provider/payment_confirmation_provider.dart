import 'dart:io';

import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/service/members_service.dart';
import 'package:capstone_alterra_flutter/service/offline_booking_service.dart';
import 'package:capstone_alterra_flutter/service/online_class_booking_service.dart';
import 'package:capstone_alterra_flutter/util/transaction_type.dart';
import 'package:flutter/material.dart';

class PaymentConfirmationProvider with ChangeNotifier{

  bool isLoading = false;

  MembersService membersService = MembersService();
  OnlineClassBookingService onlineClassBookingService = OnlineClassBookingService();
  OfflineBookingService offlineBookingService = OfflineBookingService();

  ///Upload proof for membership booking
  Future<bool> uploadProofOfMembershipPayment({
    required int bookingId,
    required TransactionType transactionType,
    required File file,
  }) async {

    isLoading = true;
    notifyListeners(); 

    late JSONModel<dynamic> json;

    switch(transactionType){
      
      case TransactionType.membership:{

        json = await membersService.uploadProofOfMembershipPayment(bookingId: bookingId, file: file);
        break;
      }
      case TransactionType.onlineClass:{

        json = await onlineClassBookingService.uploadProofOfOnlineClassBookingPayment(bookingId: bookingId, file: file);
        break;
      }
      case TransactionType.offlineClass: {

        json = await offlineBookingService.offlineClassBookingPayment(bookingId: bookingId, file: file);
        break;
      }
      case TransactionType.trainer:
        // TODO: Handle this case.
        break;
    }


    isLoading = false;
    notifyListeners();
    if(json.statusCode == 200){
      return true;
    }
    else{
      return false;
    }
  }

}