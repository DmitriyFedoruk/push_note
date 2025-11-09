import 'package:flutter/material.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/const/styles/colors.dart';

enum NotesColorsEnum {
  red(NoteColors.red, 5, 'High'),
  orange(NoteColors.orange, 4, 'Important'),
  yellow(NoteColors.yellow, 3, 'Middle'),
  green(NoteColors.green, 2, 'Secondary'),
  blue(NoteColors.blue, 1, 'Low');

  final Color color;
  final int priority;
  final String title;
  const NotesColorsEnum([this.color = Colors.transparent, this.priority = 0, this.title = '']);
}

const noteColors = NotesColorsEnum.values;
String getImage(NotesColorsEnum? type) {
  return switch (type) {
    NotesColorsEnum.red => AppImages.statusHigh,
    NotesColorsEnum.orange => AppImages.statusPreHigh,
    NotesColorsEnum.yellow => AppImages.statusMiddle,
    NotesColorsEnum.green => AppImages.statusPreMiddle,
    NotesColorsEnum.blue => AppImages.statusLow,
    null => AppImages.logo,
  };
}
