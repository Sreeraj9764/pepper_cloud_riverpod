import 'package:intl/intl.dart';

extension ShowAsDateTimeString on DateTime {
  String get toDateTimeString {
    return "${DateFormat.yMMMMd().format(this)}\n${DateFormat.jm().format(this)}";
  }
}
