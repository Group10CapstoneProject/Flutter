import 'package:capstone_alterra_flutter/model/offline_model.dart';
import 'package:capstone_alterra_flutter/model/payment_method_model.dart';
import 'package:capstone_alterra_flutter/model/user_profile_model.dart';

class OfflineBookingModel {
  OfflineBookingModel({
    required this.id,
    this.user,
    this.offlineClass,
    this.expritedAt,
    this.activedat,
    this.proofPayment,
    this.paymentMethodModel,
    this.code,
    this.total,
    this.status,
  });

  final int id;
  final UserProfileModel? user;
  final OfflineModel? offlineClass;
  final String? expritedAt;
  final String? activedat;
  final String? proofPayment;
  final PaymentMethodModel? paymentMethodModel;
  final String? code;
  final int? total;
  final String? status;

  factory OfflineBookingModel.fromJSON(Map<String, dynamic> json) {
    Map<String, dynamic>? user = json['user'];

    return OfflineBookingModel(
      id: json['id'],
      user: (user == null)
          ? null
          : UserProfileModel(
              id: user['id'],
              name: user['name'],
              email: user['email'],
              role: user['user'],
            ),
      offlineClass: (json['offline_class'] == null)
          ? null
          : OfflineModel.fromJson(
              json['offline_class'],
            ),
      expritedAt: json['expired_at'],
      activedat: json['actived_at'],
      proofPayment: json['proof_payment'],
      paymentMethodModel: (json['payment'] == null)
          ? null
          : PaymentMethodModel.fromJSON(
              json: json['payment_method'],
            ),
      code: json['code'],
      total: json['total'],
      status: json['status'],
    );
  }
}
