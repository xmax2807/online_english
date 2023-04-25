import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  static DateTime currentTime = DateTime.now();

  String toStringFormat({String format = 'EEE,dd MMM yy'}) {
    DateFormat formatter = DateFormat(format);
    return formatter.format(this);
  }

  String format(DateFormat format) {
    return format.format(this);
  }

  String formatYYYYMMdd() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  static DateTime getBeginningOfToday() {
    DateTime current = currentTime;
    return current.startOfThisDay();
  }

  static DateTime getEndOfToday() {
    DateTime current = currentTime;
    return current.endOfThisDay();
  }

  DateTime endOfThisDay() {
    return DateTime(year, month, day, 23, 59, 59);
  }

  DateTime startOfThisDay() {
    return DateTime(year, month, day, 0, 0, 0);
  }

  DateTime next(int day) {
    return add(
      Duration(
        days: (day - weekday) % DateTime.daysPerWeek,
      ),
    );
  }

  bool hasSameDate(DateTime other) {
    bool isSameDay = day == other.day;
    bool isSameMonth = month == other.month;
    bool isSameYear = year == other.year;
    return isSameYear && isSameMonth && isSameDay;
  }
}
