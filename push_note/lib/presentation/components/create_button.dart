import 'package:flutter/material.dart';
import 'package:push_note/business_logic/create_note.dart';
import 'package:push_note/const/colors.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles.dart';

class CreateButton extends StatelessWidget {
  final VoidCallback clear;
  final TextEditingController controller;
  const CreateButton({
    required this.clear,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 60.0,
        elevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        enableFeedback: false,
        color: AppColors.buttonColor.withOpacity(0.2),
        highlightColor: Colors.transparent,
        splashColor: AppColors.buttonSplashColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        onPressed: () async {
          await createNote(controller.text);
          clear();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.create,
              style: BodyTextStyle.buttonTextStyle,
            )
          ],
        ));
  }
}
