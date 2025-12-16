import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/business_logic/create_note.dart';
import 'package:push_note/business_logic/functions.dart';
import 'package:push_note/const/date.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/glassmorhic/components/custom_button.dart';
import 'package:push_note/presentation/glassmorhic/components/list_of_types.dart';
import 'package:push_note/presentation/glassmorhic/components/title_field.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';
import 'package:push_note/presentation/widgets/universal_cluster.dart';

class CreateNoteCluster extends StatefulWidget {
  const CreateNoteCluster({super.key});

  @override
  State<CreateNoteCluster> createState() => _CreateNoteClusterState();
}

class _CreateNoteClusterState extends State<CreateNoteCluster> {
  final TextEditingController _controller = TextEditingController();
  bool isDisabled = true;
  NotesColorsEnum? noteType;
  DateTime? scheduledDate;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_simpleListener);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<NotesProvider>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            TitleField(_controller),
            const SizedBox(height: 24.0),
            ListOfTypes(
              selectedItem: noteType,
              chooseItem: chooseItem,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                scheduledDate == null ? '' : '${t.scheduledAt} ${formatOnlyForDate.format(scheduledDate!)}',
                style: RobotoTextStyle.middle14,
              ),
            ),
            const SizedBox(height: 10),
            UniversalCluster(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomButton(
                      onTap: isDisabled
                          ? null
                          : () async {
                              await createNote(
                                _controller.text,
                                noteType,
                                scheduledDate,
                              );
                              provider.addNote(
                                title: _controller.text,
                                type: noteType,
                                scheduledDate: scheduledDate,
                              );
                              clear();
                            },
                      child: Text(
                        t.create,
                        style: DMSerifTextStyle.middle_24.copyWith(color: AppColors.secondaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: CustomButton(
                      onTap: () async {
                        final res = await dateTimePickerMethod(context);
                        setState(() {
                          scheduledDate = res;
                        });
                      },
                      child: const Icon(
                        Icons.calendar_month,
                        size: 24,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void clear() {
    setState(() {
      _controller.clear();
      noteType = null;
      scheduledDate = null;
    });
  }

  void _simpleListener() {
    final newIsDisabled = _controller.text.isEmpty;
    if (newIsDisabled != isDisabled) {
      setState(() {
        isDisabled = newIsDisabled;
      });
    }
  }

  void chooseItem(NotesColorsEnum item) {
    setState(() {
      if (noteType == item) {
        noteType = null;
      } else {
        noteType = item;
      }
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_simpleListener);
    _controller.dispose();
    super.dispose();
  }
}
