import 'package:flutter_svg/flutter_svg.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/extensions/color_extension.dart';
import 'package:push_note/presentation/glassmorhic/components/priority.dart';
import 'package:push_note/presentation2/widgets/base/app_card.dart';

class NeoCard extends AppCard {
  final Note note;
  final String time;
  final String date;
  final bool isScheduled;
  const NeoCard({
    super.key,
    required this.note,
    required this.time,
    required this.date,
    required this.isScheduled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Priority(note.priority),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              note.title,
              style: DMSerifTextStyle.middle.copyWith(color: _textColor),
            ),
          ),
          if (isScheduled)
            SvgPicture.asset(
              AppIcons.scheduled,
              width: 24,
              height: 24,
              colorFilter: _textColor.toFilter,
            ),
          SizedBox(
            width: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: RobotoTextStyle.small_12.copyWith(color: _dateTimeColor),
                ),
                Text(
                  date,
                  style: RobotoTextStyle.small_8.copyWith(color: _dateTimeColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

const _textColor = AppColors.black;
const _dateTimeColor = AppColors.white;
