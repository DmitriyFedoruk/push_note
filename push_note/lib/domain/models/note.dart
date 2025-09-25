import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  int? colorValue;

  @HiveField(2)
  //1 - high,2 - pre_high, 3 - middle, 4 - pre_middle, 5 - low
  int? priority;

  @HiveField(3)
  DateTime createdAt;

  Note({
    required this.title,
    NotesColorsEnum? type,
    required this.createdAt,
  })  : colorValue = type?.color.toARGB32(),
        priority = type?.priority;

  Color? get color => colorValue != null ? Color(colorValue!) : null;
}
