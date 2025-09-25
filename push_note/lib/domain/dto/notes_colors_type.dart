import 'package:flutter/material.dart';
import 'package:push_note/const/colors.dart';

enum NotesColorsEnum {
  red(NoteColors.red, 5),
  orange(NoteColors.orange, 4),
  yellow(NoteColors.yellow, 3),
  green(NoteColors.green, 2),
  blue(NoteColors.blue, 1);

  final Color color;
  final int priority;
  const NotesColorsEnum([this.color = Colors.transparent, this.priority = 0]);
}

const noteColors = NotesColorsEnum.values;
