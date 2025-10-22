import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/infra/date_extension.dart';
import 'package:push_note/presentation/components/priority.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = context.select((NotesProvider provider) => provider.notes);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.history,
          style: BodyTextStyle.appBarTextStyle,
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: ListView.separated(
        itemCount: notes.length,
        padding: const EdgeInsets.all(20),
        separatorBuilder: (
          context,
          index,
        ) {
          return const SizedBox(height: 8.0);
        },
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
    return Card(
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.createdAt.toReadFormat()),
        trailing: Priority(note.priority),
      ),
    );
  }
}
