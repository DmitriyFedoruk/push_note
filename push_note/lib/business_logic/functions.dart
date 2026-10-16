import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';

Future<DateTime?> dateTimePickerMethod(
  BuildContext context,
) async {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final lastDate = today.add(const Duration(days: 1825));

  final pickedDate = await showDatePicker(
    context: context,
    initialDate: today,
    firstDate: today,
    lastDate: lastDate,
  );
  if (pickedDate == null || !context.mounted) {
    return null;
  }

  final timeFormat = context.read<SettingsProvider>().timeFormatType;

  final pickedTime = await showTimePicker(
    context: context,
    initialEntryMode: TimePickerEntryMode.input,
    initialTime: TimeOfDay.now(),
    builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: timeFormat.is24Hour),
        child: child!,
      );
    },
  );
  if (pickedTime == null || !context.mounted) {
    return null;
  }

  final scheduled = DateTime(
    pickedDate.year,
    pickedDate.month,
    pickedDate.day,
    pickedTime.hour,
    pickedTime.minute,
  );

  if (scheduled.isBefore(now)) {
    return null;
  }

  return scheduled;
}
