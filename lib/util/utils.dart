import 'package:intl/intl.dart';

class Utils{


  ///input parameter value int 100000, output a string 'Rp 100.000'
  static String currencyFormat(int value){
    final NumberFormat numberFormat = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    String x = numberFormat.format(value);
    return x;
  }
}