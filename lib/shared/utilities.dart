part of 'shared.dart';

class Utilities {
  static String toCurrency(int? nominal, int? digit, String? symbol) {
  
    return NumberFormat.currency(
            locale: "id_ID", decimalDigits: digit ?? 0, symbol: symbol ?? "")
        .format(nominal ?? 0);
  }

  static String maskMoney(String value, String? symbol) {
    String temp = '';

    for (int i = 0; i < value.length; i++) {
      temp += value.toString().isDigit(i) ? value[i] : '';
    }

    return Utilities.toCurrency(int.tryParse(temp) ?? 0, 0, symbol ?? '');
  }
}
