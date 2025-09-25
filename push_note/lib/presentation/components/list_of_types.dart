import 'package:flutter/material.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';

class ListOfTypes extends StatelessWidget {
  final NotesColorsEnum? selectedItem;
  final Function(NotesColorsEnum) chooseItem;
  const ListOfTypes({
    required this.selectedItem,
    required this.chooseItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40.0,
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 24.0,
          children: [
            ...noteColors.map(
              (e) => _OneItem(
                e,
                isSelected: selectedItem == e,
                onTap: () {
                  chooseItem(e);
                },
              ),
            )
          ],
        ));
  }
}

class _OneItem extends StatelessWidget {
  final NotesColorsEnum item;
  final bool isSelected;
  final VoidCallback onTap;
  const _OneItem(
    this.item, {
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: isSelected ? Border.all() : null,
          color: item.color,
        ),
        child: isSelected ? const Icon(Icons.check) : null,
      ),
    );
  }
}
