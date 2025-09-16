import 'package:flutter/material.dart';
import 'package:push_note/routing/router.dart';

class PushNoteApp extends StatelessWidget {
  const PushNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
