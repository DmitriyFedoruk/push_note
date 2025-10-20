import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:push_note/business_logic/create_note.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';
import 'package:push_note/presentation/components/custom_button.dart';
import 'package:push_note/presentation/components/list_of_types.dart';
import 'package:push_note/presentation/components/title_field.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';

class CreateNoteCluster extends StatefulWidget {
  const CreateNoteCluster({super.key});

  @override
  State<CreateNoteCluster> createState() => _CreateNoteClusterState();
}

class _CreateNoteClusterState extends State<CreateNoteCluster> {
  final TextEditingController _controller = TextEditingController();
  bool isDisabled = true;
  NotesColorsEnum? noteType;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_simpleListener);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<NotesProvider>();

    return GlassmorphicContainer(
      width: double.infinity,
      height: 280,
      borderRadius: 24,
      linearGradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
        AppColors.white.withValues(alpha: 0.5),
        AppColors.white.withValues(alpha: 0.25),
      ], stops: const [
        0.1,
        1,
      ]),
      border: 2,
      blur: 20,
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.white.withValues(alpha: 0.5),
          AppColors.white.withValues(alpha: 0.5),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
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
                  const SizedBox(height: 24.0),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: isDisabled
                          ? null
                          : () async {
                              await createNote(
                                _controller.text,
                                noteType,
                              );
                              provider.addNote(title: _controller.text, type: noteType);
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
                    ),
                  ),
                  const SizedBox(width: 8),
                  CustomButton(
                    onTap: () {
                      final now = DateTime.now();
                      showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: now,
                          lastDate: now.add(const Duration(days: 1825)));
                    },
                    child: const Icon(
                      Icons.calendar_month,
                      size: 24,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  void clear() {
    setState(() {
      _controller.clear();
      noteType = null;
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
