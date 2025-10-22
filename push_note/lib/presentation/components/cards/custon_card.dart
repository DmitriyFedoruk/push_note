import 'package:flutter/material.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/presentation/components/priority.dart';

class CustomCard extends StatelessWidget {
  final CardFillType type;
  final Note note;
  const CustomCard({super.key, required this.type, required this.note});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final color = theme.cardColor;
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: type == CardFillType.gradient
              ? LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    color.withValues(alpha: 0.9),
                    color.withValues(alpha: 0.4),
                  ],
                )
              : null,
          color: color.withValues(alpha: 0.8),
          border: Border.all(
            strokeAlign: BorderSide.strokeAlignCenter,
            color: theme.dividerColor,
          )),
      child: Row(
        children: [Priority(note.priority)],
      ),
    );
  }
}
