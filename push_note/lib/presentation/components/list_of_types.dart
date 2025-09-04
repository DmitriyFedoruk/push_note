import 'package:flutter/material.dart';
import 'package:push_note/dto/notes_colors_type.dart';

class ListOfTypes extends StatelessWidget {
  const ListOfTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40.0,
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 24.0,
          children: [...noteColors.map((e) => _OneItem(e))],
        ));
  }
}

class _OneItem extends StatelessWidget {
  final NotesColorsEnum item;
  const _OneItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: item.color,
      ),
    );
  }
}
