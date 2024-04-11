import 'package:intl/intl.dart';

extension IntExtension on int {
  String toDecimal() {
    return NumberFormat.decimalPattern().format(this);
  }

  String convertToKMB() {
    const int thousand = 1000;
    if (this < thousand) {
      return toString();
    }

    const int million = thousand * thousand;
    if (this < million) {
      return '${(this / thousand).toStringAsFixed(1)}K';
    }

    const int billion = million * thousand;
    if (this < billion) {
      return '${(this / million).toStringAsFixed(1)}M';
    }

    return '${(this / billion).toStringAsFixed(1)}B';
  }
}
