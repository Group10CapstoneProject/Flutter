import 'package:capstone_alterra_flutter/model/members_types_model.dart';
import 'package:capstone_alterra_flutter/model/payment_method_model.dart';
import 'package:capstone_alterra_flutter/model/user_profile_model.dart';

class MembersDetailModel{

  MembersDetailModel({
    required this.id,
    required this.user,
    required this.memberType,
    required this.expiredAt,
    required this.activedAt,
    required this.proofPayment,
    required this.paymentMethod,
    required this.total,
    required this.code,
    required this.status,
  });

  final int id;
  final UserProfileModel user;
  final MembersTypesModel memberType;
  final String expiredAt;
  final String activedAt;
  final String proofPayment;
  final PaymentMethodModel paymentMethod;
  final int total;
  final String code;
  final String status;

  factory MembersDetailModel.fromJSON(Map<String, dynamic> json){

    Map<String, dynamic> userJson = json['user'];
    UserProfileModel user = UserProfileModel(
      id: userJson['id'],
      name: userJson['name'],
      email: userJson['email'],
    );


    return MembersDetailModel(
      id: json['id'], 
      user: user,
      memberType: MembersTypesModel.fromJSON(json: json['member_type']), 
      expiredAt: json['expired_at'], 
      activedAt: json['actived_at'], 
      proofPayment: json['proof_payment'], 
      paymentMethod: PaymentMethodModel.fromJSON(json: json['payment_method']), 
      total: json['total'], 
      code: json['code'], 
      status: json['status'],
    );
  }

}