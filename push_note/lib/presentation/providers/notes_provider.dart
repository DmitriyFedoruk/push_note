import 'package:material_ui/material_ui.dart';
import 'package:push_note/business_logic/create_note.dart';
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

    scheduledNotes.clear();
    historyNotes.clear();

    final now = DateTime.now();
    for (var n in notes) {
      if (n.scheduledDate != null && n.scheduledDate!.isAfter(now)) {
        scheduledNotes.add(n);
      } else {
        historyNotes.add(n);
      }
    }

    scheduledNotes.sort((a, b) {
      final aData = a.scheduledDate ?? a.createdAt;
      final bData = b.scheduledDate ?? b.createdAt;
      return bData.compareTo(aData);
    });

    historyNotes.sort((a, b) {
      return b.createdAt.compareTo(a.createdAt);
    });

    notifyListeners();
  }

  Future<bool> addNote({
    required String title,
    required NotesColorsEnum? type,
    required DateTime? scheduledDate,
  }) async {
    final isSuccessfully = await createNote(
      title,
      type,
      scheduledDate,
    );
    if (!isSuccessfully) return false;

    final note = Note(
      title: title,
      type: type,
      createdAt: DateTime.now(),
      scheduledDate: scheduledDate,
    );
    objectbox.addNote(note);
    // refresh list
    await loadNotes();
    return true;
  }

  Future<void> updateNote({
    required DateTime? scheduledDate,
    required Note originalNote,
  }) async {
    final title = originalNote.title;
    final type = getTypeFromPriority(originalNote.priority);
    final isSuccessfully = await createNote(
      title,
      type,
      scheduledDate,
    );
    if (!isSuccessfully) return;

    final note = Note(
      title: title,
      type: type,
      createdAt: DateTime.now(),
      scheduledDate: scheduledDate,
    );
    objectbox.addNote(note);
    await removeNote(originalNote);
  }

  Future<void> removeNote(Note note) async {
    objectbox.deleteNote(note);
    // refresh list
    await loadNotes();
  }
}
