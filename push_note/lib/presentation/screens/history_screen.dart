import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/infra/date_extension.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = context.select((NotesProvider provider) => provider.notes);
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return _OneItem(note);
        },
      ),
    );
  }
}

class _OneItem extends StatelessWidget {
  final Note note;
  const _OneItem(this.note);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.title),
      subtitle: Text(note.createdAt.toReadFormat()),
      trailing: note.priority == null
          ? const SizedBox.shrink()
          : Image.asset(
              _getImage(note.priority!),
              width: 30.0,
              height: 30.0,
            ),
    );
  }

  String _getImage(int priority) {
    return switch (priority) {
      1 => AppImages.statusHigh,
      2 => AppImages.statusPreHigh,
      3 => AppImages.statusMiddle,
      4 => AppImages.statusPreMiddle,
      5 => AppImages.statusLow,
      int() => AppImages.logo,
    };
  }
}
