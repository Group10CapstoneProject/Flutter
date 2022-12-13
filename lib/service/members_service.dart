import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/user_profile_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class MembersService{

  final Dio _dio = Dio();

  final  String _endpoint = '${UserToken.serverEndpoint}/members';

  ///http://docs.rnwxyz.codes/#/Members/post_members
  Future<JSONModel<dynamic>> createNewMembersOrBooking({
    required int memberTypeId,
    required int duration,
    required int paymentMethodId,
    required int total,
  }) async{
    
    print(memberTypeId.toString());
    print(duration.toString());
    print(paymentMethodId.toString());
    print(total.toString());

    final String accessToken = UserToken.accessToken!;

    late final Response response;
    try{
      response = await _dio.post(
        _endpoint,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            'Authorization' : 'Bearer $accessToken'
          },
        ),
        data: {
          'member_type_id' : memberTypeId,
          'duration' : duration,
          'payment_method_id' : paymentMethodId,
          'total' : total,
        }
      );
      return JSONModel.fromJSON(json: response.data, statusCode: response.statusCode!);
    }
    on DioError catch(e){
      if(e.response != null){
        return JSONModel.fromJSON(json: e.response!.data, statusCode: e.response!.statusCode!);
      }
      else{
        return JSONModel(message: 'Unexpected error');
      }
    }
  }

  // Future<JSONModel<dynamic>> uploadProofOfMembershipPayment(){

  //   final String accessToken = UserToken.accessToken!;
  //   final UserProfileModel userProfileModel = UserToken.userProfileModel!;
  //   userProfileModel.

  //   late final Response response;
  //   try{
  //     response = await _dio.post(
        
  //     )
  //   }
  //   on DioError catch(e){

  //   }
  // }
}