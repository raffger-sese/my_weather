import 'package:intl/intl.dart';

class DateUtil {
  DateUtil._internal();
  static final DateUtil instance = DateUtil._internal();

  var dateFormat = new DateFormat('MM/dd/yyyy');
  String formatDateFromMillis(int dateInMillis) {
    DateTime date =
        new DateTime.fromMillisecondsSinceEpoch(dateInMillis * 1000);
    return dateFormat.format(date);
  }
}
