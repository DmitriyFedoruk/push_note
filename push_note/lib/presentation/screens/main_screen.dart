import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/presentation/components/create_note_cluster.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                AppImages.background,
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CreateNoteCluster(),
            )
          ],
        ),
      ),
    );
  }
}
