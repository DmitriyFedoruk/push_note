import 'package:flutter/material.dart';

Future<DateTime?> datePickerMethod(
  BuildContext context,
) async {
  final now = DateTime.now();
  final first = DateTime(now.year, now.month, now.day + 1);
  return await showDatePicker(
    context: context,
    initialDate: first,
    firstDate: first,
    lastDate: first.add(
      const Duration(days: 1825),
    ),
  );
}
