import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:push_note/app.dart';
import 'package:push_note/business_logic/services/object_box.dart';
import 'package:push_note/business_logic/services/shared_preferences_service.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/main/main_methods.dart';
import 'package:push_note/main_methods.dart';

/// Provides access to the ObjectBox Store throughout the app.
late ObjectBox objectbox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeNotification();
  await SharedPreferencesService.init();
  await initLocale();

  objectbox = await ObjectBox.create();
  var orientations = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ];

  SystemChrome.setPreferredOrientations(orientations);
  runApp(TranslationProvider(
    child: const PushNoteApp(),
  ));
}
