import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/presentation/components/create_note_cluster.dart';
import 'package:push_note/presentation/components/main_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: const MainAppbar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          GestureDetector(
            onTap: () {
              SystemNavigator.pop();
            },
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                AppImages.background,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 200.0,
            ),
            child: CreateNoteCluster(),
          )
        ],
      ),
    );
  }
}
