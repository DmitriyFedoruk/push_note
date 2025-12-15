import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/extensions/color_extension.dart';
import 'package:push_note/presentation/glassmorhic/components/priority.dart';
import 'package:push_note/presentation2/widgets/base/app_card.dart';

class GlassCard extends AppCard {
  final Note note;
  final String time;
  final String date;
  final bool isScheduled;
  const GlassCard({
    super.key,
    required this.note,
    required this.time,
    required this.date,
    required this.isScheduled,
  });

  @override
  Widget build(BuildContext context) {
    const cardColor = AppColors.black;
    const textColor = AppColors.white;
    const dateTimeColor = AppColors.turquoise;

    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            cardColor.withValues(alpha: 0.9),
            cardColor.withValues(alpha: 0.4),
          ],
        ),
        color: cardColor.withValues(alpha: 0.8),
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignCenter,
          color: AppColors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Priority(note.priority),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                note.title,
                style: DMSerifTextStyle.middle.copyWith(color: textColor),
              ),
            ),
            if (isScheduled)
              SvgPicture.asset(
                AppIcons.scheduled,
                width: 24,
                height: 24,
                colorFilter: textColor.toFilter,
              ),
            SizedBox(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        time,
                        style: RobotoTextStyle.small_12
                            .copyWith(color: dateTimeColor),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        date,
                        style: RobotoTextStyle.small_8
                            .copyWith(color: dateTimeColor),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
