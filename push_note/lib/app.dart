import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/styles/themes.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/routing/router.dart';

class PushNoteApp extends StatelessWidget {
  const PushNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotesProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp.router(
          theme: theme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
