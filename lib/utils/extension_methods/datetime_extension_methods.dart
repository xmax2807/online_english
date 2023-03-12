import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toStringFormat({String format = 'EEE,dd MMM yy'}) {
    DateFormat formatter = DateFormat(format);
    return formatter.format(this);
  }
}
