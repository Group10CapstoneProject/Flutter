import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/service/members_service.dart';

class PaymentConfirmationViewmodel{

  MembersService membersService = MembersService();

  Future<bool> createNewMembersOrBooking({
    required int memberTypeId,
    required int duration,
    required int paymentMethodId,
    required int total,
  }) async{

    JSONModel<dynamic> json = await membersService.createNewMembersOrBooking(
      memberTypeId: memberTypeId, 
      duration: duration, 
      paymentMethodId: paymentMethodId, 
      total: total
    );
    print('message = ${json.message}');
    if(json.statusCode == 200){
      return true;
    }
    else{
      return false;
    }
  }

  

}