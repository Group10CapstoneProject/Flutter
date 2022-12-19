import 'package:capstone_alterra_flutter/model/members_types_model.dart';
import 'package:capstone_alterra_flutter/model/payment_method_model.dart';
import 'package:capstone_alterra_flutter/model/user_profile_model.dart';

class MembersDetailModel{

  MembersDetailModel({
    required this.id,
    this.user,
    this.memberType,
    this.expiredAt,
    this.activedAt,
    this.proofPayment,
    this.paymentMethod,
    this.total,
    this.code,
    this.status,
  });

  final int id;
  final UserProfileModel? user;
  final MembersTypesModel? memberType;
  final String? expiredAt;
  final String? activedAt;
  final String? proofPayment;
  final PaymentMethodModel? paymentMethod;
  final int? total;
  final String? code;
  final String? status;

  factory MembersDetailModel.fromJSON(Map<String, dynamic> json){

    Map<String, dynamic>? userJson = json['user'];
    UserProfileModel? user;

    if(userJson != null){
      user = UserProfileModel(
        id: userJson['id'],
        name: userJson['name'],
        email: userJson['email'],
      );
    }
    


    return MembersDetailModel(
      id: json['id'], 
      user: user,
      memberType: (json['member_type'] == null) ? null : MembersTypesModel.fromJSON(json: json['member_type']), 
      expiredAt: json['expired_at'], 
      activedAt: json['actived_at'], 
      proofPayment: json['proof_payment'], 
      paymentMethod: (json['payment_method'] == null) ? null : PaymentMethodModel.fromJSON(json: json['payment_method']), 
      total: json['total'], 
      code: json['code'], 
      status: json['status'],
    );
  }

}