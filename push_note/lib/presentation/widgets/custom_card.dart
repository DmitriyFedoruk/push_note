import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
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
import 'package:push_note/presentation/glassmorhic/components/priority.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';
import 'package:push_note/presentation/widgets/menu_button.dart';

class CustomCard extends StatelessWidget {
  final Note note;
  final TimeFormatType timeFormatType;
  final bool isScheduled;
  const CustomCard({
    super.key,
    required this.note,
    required this.timeFormatType,
    this.isScheduled = false,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<NotesProvider>();
    final color = context.theme.cardColor;
    final dateTime = isScheduled && note.scheduledDate != null
        ? note.scheduledDate!.toReadFormat(timeFormatType)
        : note.createdAt.toReadFormat(timeFormatType);
    final time = dateTime[0];
    final date = dateTime[1];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: MenuButton(
        options: [
          CustomMenuItemButtonWithIcon(
            onPressed: () async {
              final String title = note.title;
              final type = getTypeFromPriority(note.priority);
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
        child: Row(
          children: [
            Priority(note.priority),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                note.title,
                style: BebasTextStyle.middle.copyWith(color: color),
              ),
            ),
            if (isScheduled)
              SvgPicture.asset(
                AppIcons.scheduled,
                width: 24,
                height: 24,
                colorFilter: color.toFilter,
              ),
            SizedBox(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    time,
                    style: RobotoTextStyle.small_12.copyWith(color: color),
                  ),
                  Text(
                    date,
                    style: RobotoTextStyle.small_8.copyWith(color: color),
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
