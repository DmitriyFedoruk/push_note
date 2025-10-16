import 'package:flutter/material.dart';
import 'package:push_note/app.dart';
import 'package:push_note/business_logic/services/hive_service.dart';
import 'package:push_note/business_logic/services/shared_preferences_service.dart';
import 'package:push_note/main/main_methods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeNotification();
  await SharedPreferencesService.init();
  await HiveService.init();
  runApp(const PushNoteApp());
}
