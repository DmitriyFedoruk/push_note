import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';

@Entity()
class Note {
  @Id()
  int id = 0;
  String title;
  int? colorValue;
  //5 - high,4 - pre_high, 3 - middle, 2 - pre_middle, 1 - low
  int? priority;
  DateTime createdAt;

  Note({
    required this.title,
    NotesColorsEnum? type,
    required this.createdAt,
  })  : colorValue = type?.color.toARGB32(),
        priority = type?.priority;

  Color? get color => colorValue != null ? Color(colorValue!) : null;
}
