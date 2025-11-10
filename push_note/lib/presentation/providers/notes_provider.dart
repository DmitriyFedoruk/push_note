import 'package:flutter/material.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/main.dart';

class NotesProvider extends ChangeNotifier {
  List<Note> notes = [];
  List<Note> scheduledNotes = [];
  List<Note> historyNotes = [];

  NotesProvider() {
    loadNotes();
  }

  Future<void> loadNotes() async {
    notes = await objectbox.getAll();
    notes.sort((a, b) {
      return b.createdAt.compareTo(a.createdAt);
    });
    final now = DateTime.now();
    for (var n in notes) {
      if (n.scheduledDate != null && n.scheduledDate!.isAfter(now)) {
        scheduledNotes.add(n);
      } else {
        historyNotes.add(n);
      }
    }
    notifyListeners();
  }

  void addNote({
    required String title,
    required NotesColorsEnum? type,
    required DateTime? scheduledDate,
  }) {
    final note = Note(
      title: title,
      type: type,
      createdAt: DateTime.now(),
      scheduledDate: scheduledDate,
    );
    objectbox.addNote(note);
    // refresh list
    loadNotes();
  }
}
