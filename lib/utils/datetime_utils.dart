import 'package:intl/intl.dart';

class DateTimeUtils {
  static String dateToString(DateTime date) {
    final diff = calculateDateDifference(date);
    switch (diff) {
      case 0:
        return DateFormat.Hm().format(date);
      case -1:
        return 'Yesterday';
      default:
        return DateFormat.yMMMd().format(date);
    }
    // if (diff == -1) return "Yesterday";
    // if (diff == 0) return "Today";
    // if (diff == 1) {
    //   return "Tomorrow";
    // } else {
    //   return DateFormat.EEEE().format(date);
    // }
  }

  static int calculateDateDifference(DateTime date) {
    final now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  static int calculateAverage(List<int> numList) {
    final sum = numList.reduce((a, b) => a + b);
    final avg = sum / numList.length;
    return avg.toInt();
  }
}
