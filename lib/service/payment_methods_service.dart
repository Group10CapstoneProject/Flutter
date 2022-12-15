import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/payment_method_model.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class PaymentMethodsService{

  final Dio _dio = Dio();

  final  String _endpoint = '${UserToken.serverEndpoint}/payment-methods';


  ///http://docs.rnwxyz.codes/#/Payment%20Methods/get_payment_methods
  Future<JSONModel<List<PaymentMethodModel>>> getAllPaymentMethods() async{
    final String accessToken = UserToken.accessToken!;

    late final Response response;
    try{
      response = await _dio.get(
        _endpoint,
        options: Options(
          headers: {
            'Authorization' : 'Bearer $accessToken'
          }
        )
      );

      JSONModel<List> json = JSONModel.fromJSON(json: response.data, statusCode: response.statusCode!);
      List<PaymentMethodModel> listPayment = [];
      json.data?.forEach((element) { 
        listPayment.add(PaymentMethodModel.fromJSON(json: element));
      });
      return JSONModel<List<PaymentMethodModel>>(
        data: listPayment,
        message: json.message,
        statusCode: json.statusCode,
      );
    }
    on DioError catch(e){
      if(e.response != null){
        return JSONModel(message: e.response!.data['message'], statusCode: e.response!.statusCode!);
      }
      else{
        return JSONModel(message: 'Unexpected error');
      }
    }
  }

}