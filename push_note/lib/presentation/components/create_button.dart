import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/business_logic/create_note.dart';
import 'package:push_note/const/colors.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';

class CreateButton extends StatelessWidget {
  final VoidCallback clear;
  final bool isDisabled;
  final TextEditingController controller;
  final NotesColorsEnum? noteType;
  const CreateButton({
    required this.clear,
    required this.isDisabled,
    required this.controller,
    required this.noteType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<NotesProvider>();
    return MaterialButton(
      height: 60.0,
      elevation: 0,
      disabledElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      enableFeedback: false,
      color: AppColors.buttonColor.withValues(alpha: 0.2),
      disabledColor: AppColors.disabledColor,
      highlightColor: Colors.transparent,
      splashColor: AppColors.buttonSplashColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      onPressed: isDisabled
          ? null
          : () async {
              await createNote(
                controller.text,
                noteType,
              );
              provider.addNote(title: controller.text, type: noteType);
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
      ),
    );
  }
}
