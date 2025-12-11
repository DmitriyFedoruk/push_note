import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';

Future<DateTime?> dateTimePickerMethod(
  BuildContext context,
) async {
  final now = DateTime.now();
  return await showBoardDateTimePicker(
    context: context,
    pickerType: DateTimePickerType.datetime,
    initialDate: now,
    minimumDate: now,
    maximumDate: now.add(
      const Duration(days: 1825),
    ),
  );
}
