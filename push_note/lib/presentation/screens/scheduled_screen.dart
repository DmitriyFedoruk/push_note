import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/presentation/widgets/background.dart';
import 'package:push_note/presentation/widgets/custom_app_bar.dart';
import 'package:push_note/presentation/widgets/custom_card.dart';

class ScheduledScreen extends StatelessWidget {
  const ScheduledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [
        Background(),
        _List(),
      ]),
    );
  }
}

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    final timeFormatType = context.select((SettingsProvider prov) => prov.timeFormatType);
    return Consumer<NotesProvider>(builder: (context, prov, child) {
      final notes = prov.scheduledNotes;
      return CustomScrollView(
        slivers: [
          CustomSliverAppBar(t.scheduled),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 30,
            ),
            sliver: SliverList.separated(
              itemCount: notes.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 12);
              },
              itemBuilder: (context, index) {
                return CustomCard(
                  note: notes[index],
                  timeFormatType: timeFormatType,
                  isScheduled: true,
                );
              },
            ),
          )
        ],
      );
    });
  }
}
