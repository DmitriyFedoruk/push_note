import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/objectbox.g.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store store;
  late final Box<Note> _noteBox;

  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
    _noteBox = Box<Note>(store);
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: p.join(docsDir.path, "obx-example"));
    return ObjectBox._create(store);
  }

  /// Get all
  Future<List<Note>> getAll() {
    return _noteBox.getAllAsync();
  }

  /// Add
  void addNote(Note note) {
    _noteBox.put(note);
  }

  // /// Delete
  // void deleteNote(Note note) {
  //   _noteBox.put(note);
  // }
}
