part of 'shared.dart';

class Utilities {

  static String toCurrency(int nominal, int digit, String symbol ) {
    digit = digit ?? 0;
    nominal = nominal ?? 0;

    return NumberFormat.currency(
        locale: "id_ID",
        decimalDigits: digit,
        symbol: symbol ?? "")
        .format(nominal);
  }
}