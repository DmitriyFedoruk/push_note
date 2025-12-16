import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/presentation/widgets/custom_app_bar.dart';
import 'package:push_note/presentation/widgets/custom_card.dart';
import 'package:push_note/presentation/widgets/universal_background.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(t.history),
      body: const Stack(
        alignment: Alignment.topCenter,
        children: [UniversalBackground(), SafeArea(child: _List())],
      ),
    );
  }
}

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    final styleType = context.select((SettingsProvider prov) => prov.styleType);
    final timeFormatType = context.select((SettingsProvider prov) => prov.timeFormatType);
    return Consumer<NotesProvider>(
      builder: (context, prov, child) {
        final historyNotes = prov.historyNotes + prov.historyNotes + prov.historyNotes;
        return ListView.separated(
            padding: const EdgeInsetsGeometry.symmetric(
              horizontal: 24,
              vertical: 40,
            ),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 12);
            },
            itemCount: historyNotes.length,
            itemBuilder: (context, index) {
              return CustomCard(
                styleType: styleType,
                note: historyNotes[index],
                timeFormatType: timeFormatType,
                isScheduled: false,
              );
            });
      },
    );
  }
}
