import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:push_note/const/colors.dart';
import 'package:push_note/presentation/components/create_button.dart';
import 'package:push_note/presentation/components/title_field.dart';

class CreateNoteCluster extends StatefulWidget {
  const CreateNoteCluster({super.key});

  @override
  State<CreateNoteCluster> createState() => _CreateNoteClusterState();
}

class _CreateNoteClusterState extends State<CreateNoteCluster> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: double.infinity,
      height: 200,
      borderRadius: 24,
      linearGradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
        AppColors.white.withOpacity(0.5),
        AppColors.white.withOpacity(0.25),
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
          AppColors.white.withOpacity(0.5),
          AppColors.white.withOpacity(0.5),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleField(_controller),
              const SizedBox(height: 24.0),
              CreateButton(
                clear: clear,
                controller: _controller,
              ),
            ],
          )),
    );
  }

  void clear() {
    setState(() {
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
