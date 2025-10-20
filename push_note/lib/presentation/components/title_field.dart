import 'package:flutter/material.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles/colors.dart';

class TitleField extends StatelessWidget {
  final TextEditingController _controller;
  const TitleField(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: TextFormField(
        controller: _controller,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          hintText: AppStrings.printSomething,
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
      ),
    );
  }
}
