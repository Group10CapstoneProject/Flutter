import 'package:intl/intl.dart';

class Utils {
  ///input parameter value int, output a String.
  ///
  ///example: 100000 -> 'Rp 100.000'
  static String currencyFormat(int value) {
    final NumberFormat numberFormat = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    String x = numberFormat.format(value);
    return x;
  }

  ///input paramter value DateTime, output a String.
  ///
  ///example: DateTime.now() -> '6 Desember 2022'
  static String dateTimeFormat(DateTime dateTime) {
    return DateFormat('d MMMM y', 'id_ID').format(dateTime);
  }

  ///input paramter value DateTime, output a String.
  ///
  ///example: DateTime.now() -> '31/12/2022'
  static String dateTimeFormat2(DateTime dateTime) {
    return DateFormat('d/MM/y', 'id_ID').format(dateTime);
  }

  ///input paramter value DateTime, output a String.
  ///
  ///example: DateTime.now() -> 'Des 12, 2022'
  static String dateTimeFormat3(DateTime dateTime) {
    return DateFormat('MMM d, y', 'id_ID').format(dateTime);
  }

  ///input paramter value DateTime, output a String.
  ///
  ///example: DateTime.now() -> '10 : 26'
  static String dateTimeFormat4(DateTime dateTime) {
    return DateFormat('HH:mm', 'id_ID').format(dateTime);
  }

  ///input paramter value DateTime, output a String.
  ///
  ///example: DateTime.now() -> '2022-12-21'
  static String timeDate(DateTime dateTime) {
    return DateFormat('y-M-d').format(dateTime);
  }

  ///input paramter value DateTime, output a String.
  ///
  ///example: DateTime.now() -> 'Senen, 12 Desember 2022'
  static String dateTimeFormat6(DateTime dateTime) {
    return DateFormat('EEEE, d MMMM y', 'id_ID').format(dateTime);
  }
}
