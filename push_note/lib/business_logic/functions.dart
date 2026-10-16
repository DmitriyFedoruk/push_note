import 'package:material_ui/material_ui.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

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
    // theme: context.theme,
    //
  );
}
