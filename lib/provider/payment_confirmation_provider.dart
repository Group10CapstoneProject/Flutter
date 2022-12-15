import 'dart:io';

import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/service/members_service.dart';
import 'package:capstone_alterra_flutter/util/transaction_type.dart';
import 'package:flutter/material.dart';

class PaymentConfirmationProvider with ChangeNotifier{

  bool isLoading = false;

  MembersService membersService = MembersService();

  Future<bool> uploadProofOfMembershipPayment({
    required int bookingId,
    required TransactionType transactionType,
    required File file,
  }) async {

    isLoading = true;
    notifyListeners();

    JSONModel<dynamic> json = await membersService.uploadProofOfMembershipPayment(bookingId: bookingId, file: file);

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