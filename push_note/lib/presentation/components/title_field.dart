import 'package:flutter/material.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/theme_extension.dart';

class TitleField extends StatelessWidget {
  final TextEditingController _controller;
  const TitleField(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return SizedBox(
      height: 60.0,
      child: TextFormField(
        controller: _controller,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        textCapitalization: TextCapitalization.sentences,
        style: RobotoTextStyle.middle14.copyWith(color: theme.textTheme.bodyMedium?.color),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          hintText: AppStrings.printSomething,
          hintStyle: RobotoTextStyle.middle14.copyWith(color: theme.hoverColor),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.textTheme.bodyMedium?.color ?? AppColors.black),
            borderRadius: BorderRadius.circular(24.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.hoverColor),
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
    );
  }
}
