import 'package:flutter/material.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/infra/date_extension.dart';
import 'package:push_note/presentation/components/priority.dart';

class CustomCard extends StatelessWidget {
  final CardFillType type;
  final Note note;
  final TimeFormatType timeFormatType;
  const CustomCard({super.key, required this.type, required this.note, required this.timeFormatType});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final color = theme.cardColor;
    final dateTime = note.createdAt.toReadFormat(timeFormatType);
    final time = dateTime[0];
    final date = dateTime[1];
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: type == CardFillType.gradient
            ? LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  color.withValues(alpha: 0.9),
                  color.withValues(alpha: 0.4),
                ],
              )
            : null,
        color: color.withValues(alpha: 0.8),
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignCenter,
          color: theme.dividerColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Priority(note.priority),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                AppStrings.createNewTask,
                style: DMSerifTextStyle.middle.copyWith(color: theme.textTheme.labelMedium?.color),
              ),
            ),
            SizedBox(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        time,
                        style: RobotoTextStyle.small_12.copyWith(color: theme.textTheme.labelLarge?.color),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        date,
                        style: RobotoTextStyle.small_8.copyWith(color: theme.textTheme.labelLarge?.color),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
