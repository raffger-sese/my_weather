import 'package:intl/intl.dart';

class DateUtil {
  DateUtil._internal();
  static final DateUtil instance = DateUtil._internal();

  var dateFormat = new DateFormat('dd MMM yyyy, hh:mm a');
  String formatDate(int dateInMillis) {
    DateTime date =
        new DateTime.fromMillisecondsSinceEpoch(dateInMillis * 1000);
    return dateFormat.format(date);
  }

  var documentDateFormat = new DateFormat('dd MMM, yyyy');
  int toDateinMillis(String dateString) {
    DateTime date = documentDateFormat.parse(dateString);
    return date.millisecondsSinceEpoch;
  }

  var dateFormatMonthOnly = new DateFormat('MMMM');
  String getMonthNow() {
    DateTime date = new DateTime.now();
    return dateFormatMonthOnly.format(date);
  }

  // var startDateFormat = new DateFormat('d MMMM, yyyy');
  String convertToString(DateTime date) {
    return subsDateFormat.format(date);
  }

  var dayAndTimeFormat = new DateFormat('EEEE h:mm a');
  String convertToDayAndTimeOnly(DateTime date) {
    return dayAndTimeFormat.format(date);
  }

  var dayOnlyFormat = new DateFormat('dd');
  String convertToDayOnly(DateTime date) {
    return dayOnlyFormat.format(date);
  }

  var monthOnlyFormat = new DateFormat('MMM');
  String convertToMonthOnly(DateTime date) {
    return monthOnlyFormat.format(date);
  }

  var dateFormaTimeOnly = new DateFormat('h:mm a');
  String convertToTimeOnly(DateTime date) {
    return dateFormaTimeOnly.format(date);
  }

  var subsDateFormat = new DateFormat('yyyy-MM-dd');
  String convertToSubsString(DateTime date) {
    return subsDateFormat.format(date);
  }

  var auLongFormat = new DateFormat('dd/MM/yyy');
  var auShortFormat = new DateFormat('MM/yyy');
  String convertToStringAuLongFormat(DateTime date) {
    return auLongFormat.format(date);
  }

  String convertToStringAuShortFormat(DateTime date) {
    return auShortFormat.format(date);
  }

  bool isFutureDate(String dateString) {
    if (dateString != null) {
      var diff = subsDateFormat.parse(dateString).difference(DateTime.now());
      if (diff.inSeconds > 0) {
        return true;
      }
    }

    return false;
  }

  DateTime convertToDateTime(String dateinString) {
    return subsDateFormat.parse(dateinString);
  }

  String convertToSubsDateTimeFormat(String dateinString) {
    // convert from dd/MM/yyy to yyyy-MM-dd
    if (dateinString != null) {
      var dateArray = dateinString.split('/');
      if (dateArray.length == 3) {
        return '${dateArray[2]}-${dateArray[1]}-${dateArray[0]}';
      } else if (dateArray.length == 2) {
        // claims date
        return '${dateArray[1]}-${dateArray[0]}-01';
      }
    }
    return dateinString;
  }

  String formatShortDateFromString(String dateInput) {
    return formatShortDate(subsDateFormat.parse(dateInput),
        dateFormat: DateFormat('MMMM'));
  }

  var shortFormat = new DateFormat('MMM');
  String formatShortDate(DateTime dateInput, {DateFormat dateFormat}) {
    if (dateFormat == null) dateFormat = shortFormat;
    var appender = "";
    switch (dateInput.day % 10) {
      case 1:
        {
          appender = 'st';
          break;
        }
      case 2:
        {
          appender = 'nd';
          break;
        }
      case 3:
        {
          appender = 'rd';
          break;
        }
      default:
        {
          appender = 'th';
          break;
        }
    }

    return '${dateInput.day}$appender ${dateFormat.format(dateInput)}';
  }
}
