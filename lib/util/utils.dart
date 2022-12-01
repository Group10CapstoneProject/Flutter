import 'package:intl/intl.dart';

class Utils{

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