import 'package:hive_flutter/hive_flutter.dart';
import 'package:push_note/domain/models/note.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    // Register the adapter
    Hive.registerAdapter(NoteAdapter());
    // Open a box
    await Hive.openBox<Note>('notes');
  }

  static Box<Note> get notesBox => Hive.box<Note>('notes');
}
