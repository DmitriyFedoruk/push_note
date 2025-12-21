import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:push_note/extensions/theme_extension.dart';

Future<DateTime?> dateTimePickerMethod(
  BuildContext context,
) async {
  final now = DateTime.now();
  return await showOmniDateTimePicker(
    context: context,
    initialDate: now,
    firstDate: now,
    lastDate: now.add(
      const Duration(days: 1825),
    ),
    is24HourMode: true,
    //UI
    borderRadius: BorderRadius.circular(0),
    theme: context.theme,

    //
  );
}
