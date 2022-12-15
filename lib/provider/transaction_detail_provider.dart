import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/members_detail_model.dart';
import 'package:capstone_alterra_flutter/model/payment_method_model.dart';
import 'package:capstone_alterra_flutter/model/transaction_model.dart';
import 'package:capstone_alterra_flutter/service/members_service.dart';
import 'package:capstone_alterra_flutter/service/payment_methods_service.dart';
import 'package:capstone_alterra_flutter/util/transaction_type.dart';
import 'package:flutter/material.dart';

class TransactionDetailProvider with ChangeNotifier{

  bool isLoading = false;
  List<PaymentMethodModel> listPayment = [];
  


  Future<void> getAllPaymentMethods() async{

    isLoading = true;
    notifyListeners();

    listPayment.clear();
    PaymentMethodsService paymentService = PaymentMethodsService();

    JSONModel<List<PaymentMethodModel>> json = await paymentService.getAllPaymentMethods();

    if(json.statusCode == 200){
      listPayment.addAll(json.data!);
    }

    isLoading = false;
    notifyListeners();
  }





  Future<int?> _createNewMembersOrBooking({
    required int memberTypeId,
    required int duration,
    required int paymentMethodId,
    required int total,
  }) async{

    MembersService membersService = MembersService();

    JSONModel<MembersDetailModel> json = await membersService.createNewMembersOrBooking(
      memberTypeId: memberTypeId, 
      duration: duration, 
      paymentMethodId: paymentMethodId, 
      total: total
    );

    if(json.statusCode == 200){
      return json.data!.id;
    }
    else{
      return null;
    }
  }





  Future<int?> createBookingAllPurpose({
    required PaymentMethodModel paymentMethodModel,
    required TransactionModel transactionModel,
  }) async{

    isLoading = true;
    notifyListeners();

    int? bookingId;

    switch(transactionModel.transactionType){
      
      case TransactionType.membership: {

        bookingId = await _createNewMembersOrBooking(
          memberTypeId: int.parse(transactionModel.id), 
          duration: transactionModel.quantity, 
          paymentMethodId: int.parse(paymentMethodModel.id), 
          total: transactionModel.totalPrice
        );
        break;
      }

      case TransactionType.onlineClass:
        // TODO: Handle this case.
        break;
      case TransactionType.offlineClass:
        // TODO: Handle this case.
        break;
      case TransactionType.trainer:
        // TODO: Handle this case.
        break;
    }

    isLoading = false;
    notifyListeners();

    return bookingId;
  }
}