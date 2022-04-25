import 'package:intl/intl.dart';

extension FormatExtensions on num {
  String get makeFormattedWithSpace {
    return NumberFormat.decimalPattern().format(this).replaceAll(',', ' ');
  }

  String get makeFormattedWithComma {
    return NumberFormat.decimalPattern().format(this);
  }
}
