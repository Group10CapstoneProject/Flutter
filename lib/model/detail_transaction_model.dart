import 'package:flutter/cupertino.dart';

class DetailTransactionModel{

  DetailTransactionModel({
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  final Widget icon;
  final String title;
  final String subTitle;
}