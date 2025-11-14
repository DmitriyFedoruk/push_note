import 'package:flutter/material.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/const/styles/colors.dart';

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

NotesColorsEnum? getTypeFromPriority(int? priority) {
  return switch (priority) {
    5 => NotesColorsEnum.red,
    4 => NotesColorsEnum.orange,
    3 => NotesColorsEnum.yellow,
    2 => NotesColorsEnum.green,
    1 => NotesColorsEnum.blue,
    null => null,
    int() => null,
  };
}
