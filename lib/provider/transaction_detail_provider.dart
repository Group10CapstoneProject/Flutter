import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/members_detail_model.dart';
import 'package:capstone_alterra_flutter/model/offline_class_booking_model.dart';
import 'package:capstone_alterra_flutter/model/online_class_booking_model.dart';
import 'package:capstone_alterra_flutter/model/payment_method_model.dart';
import 'package:capstone_alterra_flutter/model/transaction_model.dart';
import 'package:capstone_alterra_flutter/service/members_service.dart';
import 'package:capstone_alterra_flutter/service/offline_booking_service.dart';
import 'package:capstone_alterra_flutter/service/online_class_booking_service.dart';
import 'package:capstone_alterra_flutter/service/payment_methods_service.dart';
import 'package:capstone_alterra_flutter/util/transaction_type.dart';
import 'package:flutter/material.dart';

class TransactionDetailProvider with ChangeNotifier{

  bool isLoading = false;
  List<PaymentMethodModel> listPayment = [];
  


  Future<void> getAllPaymentMethods({required TransactionType transactionType, required bool? isMemberAccess}) async{

    isLoading = true;
    notifyListeners();

    listPayment.clear();
    PaymentMethodsService paymentService = PaymentMethodsService();

    JSONModel<List<PaymentMethodModel>> json = await paymentService.getAllPaymentMethods();

    if(json.statusCode == 200){
      listPayment.addAll(json.data!);
    }

    if(transactionType != TransactionType.membership && isMemberAccess == true){
      listPayment.insert(
        0, 
        PaymentMethodModel(id: '0', picture: null, name: 'My Membership')
      );
    }

    isLoading = false;
    notifyListeners();
  }




  ///For membership booking
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


  ///For online class booking
  Future<int?> _createNewOnlineClassBookingOrTransaction({
    required int onlineClassId,
    required int duration,
    required int paymentMethodId,
    required int total,
  }) async{
    
    OnlineClassBookingService onlineClassBookingService = OnlineClassBookingService();

    JSONModel<OnlineClassBookingModel> json = await onlineClassBookingService.createNewOnlineClassBookingOrTransaction(
      onlineClassId: onlineClassId, 
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

  ///For offline class booking
  Future<int?> _createNewOfflineClassBookingOrTranssaction({
    required int offlineClassId,
    required int paymentMethodId,
    required int total,
  }) async {
    OfflineBookingService offlineBookingService = OfflineBookingService();

    JSONModel<OfflineBookingModel> json = await offlineBookingService.offlineBookingTransaction(
      offlineClassId: offlineClassId, 
      paymentMethodId: paymentMethodId, 
      total: total,
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

      case TransactionType.onlineClass:{

        bookingId = await _createNewOnlineClassBookingOrTransaction(
          onlineClassId: int.parse(transactionModel.id), 
          duration: 1, 
          paymentMethodId: int.parse(paymentMethodModel.id), 
          total: transactionModel.totalPrice
        );
        break;
      }
      case TransactionType.offlineClass: {
        bookingId = await _createNewOfflineClassBookingOrTranssaction(
          offlineClassId: int.parse(transactionModel.id), 
          paymentMethodId: int.parse(paymentMethodModel.id), 
          total: transactionModel.price,
          );
      }
       
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