import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:flutter/material.dart';

enum Membership{
  bronze,
  silver,
  gold,
  platinum
}

class MembershipClass{

  MembershipClass({
    required this.name,
    required this.coinFile,
    required this.color,
    required this.price,
    required this.benefit
  }){
    priceFormatted = Utils.currencyFormat(price);
  }

  final String name;
  final String coinFile;
  final Color color;
  final int price;
  final List<String> benefit;

  late final String priceFormatted;

  factory MembershipClass.fromMembership(Membership membership){
    switch(membership){
      case(Membership.bronze): {
        return MembershipClass._bronze;
      }
      case(Membership.silver): {
        return MembershipClass._silver;
      }
      case(Membership.gold): {
        return MembershipClass._gold;
      }
      case(Membership.platinum): {
        return MembershipClass._platinum;
      }
    }
  }

  static final MembershipClass _bronze = MembershipClass(
    name: 'Bronze',
    coinFile: 'coin_bronze.png',
    color: const  Color(0xFF8035E1),
    price: 300000,
    benefit: [
      'Dapatkan akses prioritas ketika melakukan booking',
      'Dapatkan akses prioritas ketika melakukan booking',
      'Dapatkan akses prioritas ketika melakukan booking',
      'Dapatkan akses prioritas ketika melakukan booking',
    ],
  );

  static final MembershipClass _silver = MembershipClass(
    name: 'Silver',
    coinFile: 'coin_silver.png',
    color: const Color(0xFF4DB4EE),
    price: 650000,
    benefit: [
      'Dapatkan akses prioritas ketika melakukan booking',
      'Dapatkan akses prioritas ketika melakukan booking',
      'Dapatkan akses prioritas ketika melakukan booking',
      'Dapatkan akses prioritas ketika melakukan booking',
    ],
  );

  static final MembershipClass _gold = MembershipClass(
    name: 'Gold',
    coinFile: 'coin_gold.png',
    color: const Color(0xFF7DC741),
    price: 900000,
    benefit: [
      'Dapatkan akses prioritas ketika melakukan booking',
      'Dapatkan akses prioritas ketika melakukan booking',
      'Dapatkan akses prioritas ketika melakukan booking',
      'Dapatkan akses prioritas ketika melakukan booking',
    ],
  );

  static final MembershipClass _platinum = MembershipClass(
    name: 'Platinum',
    coinFile: 'coin_platinum.png',
    color: const Color(0xFFDD5533),
    price: 1220000,
    benefit: [
      'Dapatkan akses prioritas ketika melakukan booking',
      'Dapatkan akses prioritas ketika melakukan booking',
      'Dapatkan akses prioritas ketika melakukan booking',
      'Dapatkan akses prioritas ketika melakukan booking',
    ],
  );
}





