import 'package:intl/intl.dart';

class Utils{


  ///input parameter value int, output a String
  ///example: 100000 -> 'Rp 100.000'
  static String currencyFormat(int value){
    final NumberFormat numberFormat = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    String x = numberFormat.format(value);
    return x;
  }

  ///input paramter value DateTime, output a String
  ///example: DateTime.now() -> '6 Desember 2022'
  static String dateTimeFormat(DateTime dateTime){
    return DateFormat('d MMMM y', 'id_ID').format(dateTime);
  }
}