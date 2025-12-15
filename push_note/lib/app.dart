import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/routing/router.dart';

class PushNoteApp extends StatelessWidget {
  const PushNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => NotesProvider()),
      ChangeNotifierProvider(create: (_) => SettingsProvider()),
    ], child: const _App());
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    final theme = context.select((SettingsProvider provider) => provider.theme);
    return MaterialApp.router(
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: theme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
