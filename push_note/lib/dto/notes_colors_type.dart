import 'package:flutter/material.dart';
import 'package:push_note/const/colors.dart';

enum NotesColorsEnum {
  red(NoteColors.red),
  orange(NoteColors.orange),
  yellow(NoteColors.yellow),
  green(NoteColors.green),
  blue(NoteColors.blue);

  final Color color;
  const NotesColorsEnum([this.color = Colors.transparent]);
}

const noteColors = NotesColorsEnum.values;
