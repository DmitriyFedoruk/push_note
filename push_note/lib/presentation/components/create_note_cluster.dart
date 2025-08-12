import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:push_note/const/colors.dart';
import 'package:push_note/presentation/components/create_button.dart';

class CreateNoteCluster extends StatelessWidget {
  const CreateNoteCluster({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: double.infinity,
      height: 400,
      borderRadius: 24,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.white.withOpacity(0.5),
            AppColors.white.withOpacity(0.25),
          ],
          stops: const [
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
      child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              CreateButton(),
            ],
          )),
    );
  }
}
