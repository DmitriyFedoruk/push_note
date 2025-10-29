import 'package:flutter/material.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/main.dart';

class NotesProvider extends ChangeNotifier {
  List<Note> notes = [];
  NotesProvider() {
    loadNotes();
  }

  Future<void> loadNotes() async {
    notes = await objectbox.getAll();
    print("notes $notes");
    notes.sort((a, b) {
      return b.createdAt.compareTo(a.createdAt);
    });
    notifyListeners();
  }

  void addNote({
    required String title,
    required NotesColorsEnum? type,
  }) {
    final note = Note(title: title, type: type, createdAt: DateTime.now());
    objectbox.addNote(note);
    // refresh list
    loadNotes();
  }
}
