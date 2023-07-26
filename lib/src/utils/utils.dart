import 'package:intl/intl.dart';

class Utils {
  static String convertCurrencyFormat(double money) {
    return NumberFormat.simpleCurrency(locale: 'vi-VI', decimalDigits: 0)
        .format(money);
  }
}
