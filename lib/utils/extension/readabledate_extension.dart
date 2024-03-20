import 'package:intl/intl.dart';

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

// for (int i = 0; i <= dates.length; i++) {
//   //first if for checking month
//   if (i + 1 <= dates.length) {
//     if (dates[i].isSameDate(dates[i + 1])) {
//       filteredDate.remove(dates[i]);
//     }
//   }
// }

// setState(() {});

// dev.log(" filtered date ${filteredDate.toList().toString()}");

extension DateExtension on DateTime {
  String todateday(DateTime somedate) {
    String dateday = somedate.day.toString();
    return dateday;
  }

  String toweekdday(DateTime somedate) {
    var date = somedate;
    String dateFormatWeekday = DateFormat("EEE").format(date);
    return dateFormatWeekday;
  }

  String tomonth(DateTime somedate) {
    var date = somedate;
    String dateFormatMonth = DateFormat("MMM").format(date);
    return dateFormatMonth;
  }

  String toYear(DateTime somedate) {
    var date = somedate;
    String dateYear = date.year.toString();
    return dateYear;
  }
}
