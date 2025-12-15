import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/extensions/color_extension.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/infra/date_extension.dart';
import 'package:push_note/presentation/glassmorhic/components/priority.dart';

class BrutalismCard extends StatelessWidget {
  final Note note;
  final TimeFormatType timeFormatType;
  final bool isScheduled;
  const BrutalismCard({
    super.key,
    required this.note,
    required this.timeFormatType,
    this.isScheduled = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final color = theme.cardColor;
    final dateTime = isScheduled && note.scheduledDate != null
        ? note.scheduledDate!.toReadFormat(timeFormatType)
        : note.createdAt.toReadFormat(timeFormatType);
    final time = dateTime[0];
    final date = dateTime[1];
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            color.withValues(alpha: 0.9),
            color.withValues(alpha: 0.4),
          ],
        ),
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
                note.title,
                style: DMSerifTextStyle.middle.copyWith(color: theme.textTheme.labelMedium?.color),
              ),
            ),
            if (isScheduled)
              SvgPicture.asset(
                AppIcons.scheduled,
                width: 24,
                height: 24,
                colorFilter: theme.textTheme.labelMedium?.color?.toFilter,
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
