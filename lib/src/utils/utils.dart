import 'package:intl/intl.dart';
import 'package:s_fashion/src/constants/base_url.dart';

class Utils {
  static String convertCurrencyFormat(double money) {
    return NumberFormat.simpleCurrency(locale: 'vi-VI', decimalDigits: 0)
        .format(money);
  }

  static String getUrlImageProduct(String image) {
    return BaseUrl.imgProduct + image;
  }

  static String getUrlImageUser(String image) {
    return BaseUrl.imgUser + image;
  }
}
