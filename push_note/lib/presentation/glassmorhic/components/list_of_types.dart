import 'package:flutter/material.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/widgets/universal_cluster.dart';

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
    return UniversalCluster(
      child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
            ],
          )),
    );
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
      child: Column(
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: isSelected
                  ? Border.all(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: context.theme.cardColor,
                    )
                  : null,
              color: item.color,
            ),
            padding: const EdgeInsets.all(6),
            child: Image.asset(
              getImage(item),
              color: context.theme.cardColor,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            getTitle(item),
            style: RobotoTextStyle.small_12_reg,
          )
        ],
      ),
    );
  }

  String getTitle(NotesColorsEnum note) {
    return switch (note.priority) {
      5 => t.high,
      4 => t.important,
      3 => t.middle,
      2 => t.secondary,
      1 => t.low,
      int() => t.low,
    };
  }
}
