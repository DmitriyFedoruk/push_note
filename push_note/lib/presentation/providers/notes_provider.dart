import 'package:flutter/material.dart';
import 'package:push_note/business_logic/repositories/notes_repository.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';
import 'package:push_note/domain/models/note.dart';

class NotesProvider extends ChangeNotifier {
  final NotesRepository _repo = NotesRepository();

  List<Note> notes = [];
  NotesProvider() {
    loadNotes();
  }

  void loadNotes() {
    notes = _repo.getAllNotes();
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
    _repo.addNote(note);
    // refresh list
    loadNotes();
  }
}
