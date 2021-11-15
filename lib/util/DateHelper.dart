import 'package:intl/intl.dart';

class DateHelper {
  static String? getDisplayTextDateFromDate(String? dateTime) {
    if (dateTime != null && dateTime.isNotEmpty) {
      final date = DateTime.parse(dateTime);
      if (isSameDay(date, DateTime.now())) {
        return "To Day";
      }
      // else if (isOverdue(date, DateTime.now())) {
      //   return "Overdue";
      // }
      else {
        return DateFormat("dd/MM/yyyy").format(date);
      }
    }
    return null;
  }

  static bool isSameDay(DateTime dateTimeSource, DateTime dateTimeDestination) {
    return dateTimeSource.year == dateTimeDestination.year &&
        dateTimeSource.month == dateTimeDestination.month &&
        dateTimeSource.day == dateTimeDestination.day;
  }
}
