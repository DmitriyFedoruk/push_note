import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:push_note/business_logic/create_note.dart';
import 'package:push_note/business_logic/functions.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/extensions/color_extension.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/infra/date_extension.dart';
import 'package:push_note/presentation/components/menu_button.dart';
import 'package:push_note/presentation/components/priority.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';

class CustomCard extends StatelessWidget {
  final CardFillType type;
  final Note note;
  final TimeFormatType timeFormatType;
  final bool isScheduled;
  const CustomCard({
    super.key,
    required this.type,
    required this.note,
    required this.timeFormatType,
    this.isScheduled = false,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<NotesProvider>();
    final theme = context.theme;
    final color = theme.cardColor;
    final dateTime = isScheduled && note.scheduledDate != null
        ? note.scheduledDate!.toReadFormat(timeFormatType)
        : note.createdAt.toReadFormat(timeFormatType);
    final time = dateTime[0];
    final date = dateTime[1];
    return MenuButton(
      options: [
        CustomMenuItemButtonWithIcon(
          onPressed: () async {
            final String title = note.title;
            final type = getTypeFromPriority(note.priority);
            await createNote(
              title,
              type,
              null,
            );
            provider.addNote(
              title: title,
              type: type,
              scheduledDate: null,
            );
          },
          text: t.addNow,
          icon: AppIcons.add,
        ),
        if (isScheduled)
          CustomMenuItemButtonWithIcon(
            onPressed: () async {
              final res = await dateTimePickerMethod(context);
              if (res != null) {
                final String title = note.title;
                final type = getTypeFromPriority(note.priority);
                await createNote(
                  title,
                  type,
                  res,
                );
                provider.addNote(
                  title: title,
                  type: type,
                  scheduledDate: res,
                );
              }
            },
            text: t.reschedule,
            icon: AppIcons.reschedule,
          ),
        CustomMenuItemButtonWithIcon(
          onPressed: () {
            provider.removeNote(note);
          },
          text: t.remove,
          icon: AppIcons.trash,
        ),
      ],
      offset: const Offset(180, -20),
      child: Container(
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
      ),
    );
  }
}
