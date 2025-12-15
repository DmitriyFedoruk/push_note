import 'package:push_note/const/enums.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/infra/date_extension.dart';
import 'package:push_note/presentation2/widgets/base/app_card.dart';
import 'package:push_note/presentation2/widgets/brut/brut_card.dart';
import 'package:push_note/presentation2/widgets/glass/glass_card.dart';
import 'package:push_note/presentation2/widgets/neo/neo_card.dart';

class WidgetResolver {
  static AppCard card(
    StyleType style, {
    required Note note,
    required TimeFormatType timeFormatType,
    required bool isScheduled,
  }) {
    final dateTime = isScheduled && note.scheduledDate != null
        ? note.scheduledDate!.toReadFormat(timeFormatType)
        : note.createdAt.toReadFormat(timeFormatType);
    final time = dateTime[0];
    final date = dateTime[1];
    switch (style) {
      case StyleType.glass:
        return GlassCard(
          note: note,
          time: time,
          date: date,
          isScheduled: isScheduled,
        );

      case StyleType.neo:
        return NeoCard(
          note: note,
          time: time,
          date: date,
          isScheduled: isScheduled,
        );
      case StyleType.brut:
        return BrutCard(
          note: note,
          time: time,
          date: date,
          isScheduled: isScheduled,
        );
    }
  }
}
