import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:push_note/app.dart';
import 'package:push_note/main/main_methods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeNotification();
  runApp(const ProviderScope(child: PushNoteApp()));
}
