import 'package:capstone_alterra_flutter/model/online_class_model.dart';
import 'package:capstone_alterra_flutter/model/payment_method_model.dart';
import 'package:capstone_alterra_flutter/model/user_profile_model.dart';

class OnlineClassBookingModel{

  OnlineClassBookingModel({
    required this.id,
    required this.user,
    required this.onlineClass,
    this.expiredAt,
    this.activedAt,
    this.duration,
    this.proofPayment,
    this.paymentMethod,
    this.total,
    this.status,
  });

  final int id;
  final UserProfileModel? user;
  final OnlineClassModel? onlineClass;
  final String? expiredAt;
  final String? activedAt;
  final int? duration;
  final String? proofPayment;
  final PaymentMethodModel? paymentMethod;
  final int? total;
  final String? status;

  
  factory OnlineClassBookingModel.fromJSON(Map<String, dynamic> json){

    Map<String, dynamic>? user = json['user'];
    

    return OnlineClassBookingModel(
      id: json['id'], 
      user: (user == null) ? null : UserProfileModel(
        id: user['id'],
        email: user['email'],
        name: user['name'],
        role: user['role'],
      ), 
      onlineClass: (json['online_class'] == null)? null : OnlineClassModel.fromJSON(json['online_class']),
      expiredAt: json['expired_at'],
      activedAt: json['actived_at'],
      duration: json['duration'],
      proofPayment: json['proof_payment'],
      paymentMethod: (json['payment'] == null) ? null : PaymentMethodModel.fromJSON(json: json['payment_method']),
      total: json['total'],
      status: json['status'],

    );
  }
}