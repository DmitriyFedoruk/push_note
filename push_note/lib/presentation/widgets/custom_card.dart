import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/business_logic/create_note.dart';
import 'package:push_note/business_logic/functions.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/brutalism/components/card/brutalism_card.dart';
import 'package:push_note/presentation/glassmorhic/components/cards/glassmorphic_card.dart';
import 'package:push_note/presentation/glassmorhic/components/menu_button.dart';
import 'package:push_note/presentation/neumorphic/components/card/neumorphic_card.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';

class CustomCard extends StatelessWidget {
  final StyleType styleType;
  final Note note;
  final TimeFormatType timeFormatType;
  final bool isScheduled;
  const CustomCard({
    super.key,
    required this.styleType,
    required this.note,
    required this.timeFormatType,
    this.isScheduled = false,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<NotesProvider>();

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
        child: switch (styleType) {
          StyleType.glassmorphic => GlassmorphicCard(note: note, timeFormatType: timeFormatType),
          StyleType.neumorphic => BrutalismCard(
              note: note,
              timeFormatType: timeFormatType,
            ),
          StyleType.brutalism => NeumorphicCard(
              note: note,
              timeFormatType: timeFormatType,
            ),
        });
  }
}
