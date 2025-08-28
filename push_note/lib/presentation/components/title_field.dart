import 'package:flutter/material.dart';
import 'package:push_note/const/colors.dart';

class TitleField extends StatelessWidget {
  final TextEditingController _controller;
  const TitleField(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.buttonSplashColor),
          borderRadius: BorderRadius.circular(24.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
    );
  }
}
