import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:push_note/const/colors.dart';
import 'package:push_note/dto/notes_colors_type.dart';
import 'package:push_note/presentation/components/create_button.dart';
import 'package:push_note/presentation/components/list_of_types.dart';
import 'package:push_note/presentation/components/title_field.dart';

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
    return GlassmorphicContainer(
      width: double.infinity,
      height: 250,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleField(_controller),
              const SizedBox(height: 24.0),
              ListOfTypes(
                selectedItem: noteType,
                chooseItem: chooseItem,
              ),
              const SizedBox(height: 24.0),
              CreateButton(
                clear: clear,
                controller: _controller,
                isDisabled: isDisabled,
                noteType: noteType,
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
