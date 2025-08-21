import 'package:flutter/material.dart';
import 'package:push_note/providers.dart';

class TitleField extends StatelessWidget {
  const TitleField({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: titleNotifier,
      builder: (context, value, child) {
        return TextFormField(
          initialValue: value,
          onChanged: (value) => titleNotifier.value = value,
        );
      },
    );
  }
}
