import 'package:flutter/material.dart';
import 'package:push_note/presentation/screens/main_screen.dart';

class PushNoteApp extends StatelessWidget {
  const PushNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
