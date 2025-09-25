import 'package:push_note/const/date.dart';

extension DateTimeStyle on DateTime {
  String toReadFormat() {
    //englishFormat
    return russianFormat.format(this);
  }
}
