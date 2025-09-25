import 'package:hive/hive.dart';
import 'package:push_note/business_logic/services/hive_service.dart';
import 'package:push_note/domain/models/note.dart';

class NotesRepository {
  final Box<Note> _notesBox = HiveService.notesBox;

  List<Note> getAllNotes() => _notesBox.values.toList();

  void addNote(Note note) {
    _notesBox.add(note);
  }

  void deleteNote(int index) {
    _notesBox.deleteAt(index);
  }

  Note? getUser(int index) => _notesBox.getAt(index);
}
