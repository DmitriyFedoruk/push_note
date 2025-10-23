import 'package:push_note/const/date.dart';
import 'package:push_note/const/enums.dart';

extension DateTimeStyle on DateTime {
  List<String> toReadFormat(TimeFormatType timeFormatType) {
    final date = (timeFormatType == TimeFormatType.hours24 ? format24 : format12).format(this);
    return date.split(', ');
  }
}
