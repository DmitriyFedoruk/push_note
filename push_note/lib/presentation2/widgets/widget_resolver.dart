import 'package:flutter/material.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/infra/date_extension.dart';
import 'package:push_note/presentation2/widgets/base/app_background.dart';
import 'package:push_note/presentation2/widgets/base/app_card.dart';
import 'package:push_note/presentation2/widgets/base/app_cluster.dart';
import 'package:push_note/presentation2/widgets/base/app_title.dart';
import 'package:push_note/presentation2/widgets/brut/brut_background.dart';
import 'package:push_note/presentation2/widgets/brut/brut_card.dart';
import 'package:push_note/presentation2/widgets/brut/brut_cluster.dart';
import 'package:push_note/presentation2/widgets/brut/brut_title.dart';
import 'package:push_note/presentation2/widgets/glass/glass_background.dart';
import 'package:push_note/presentation2/widgets/glass/glass_card.dart';
import 'package:push_note/presentation2/widgets/glass/glass_cluster.dart';
import 'package:push_note/presentation2/widgets/glass/glass_title.dart';
import 'package:push_note/presentation2/widgets/neo/neo_background.dart';
import 'package:push_note/presentation2/widgets/neo/neo_card.dart';
import 'package:push_note/presentation2/widgets/neo/neo_cluster.dart';
import 'package:push_note/presentation2/widgets/neo/neo_title.dart';

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

  // Cluster
  static AppCluster cluster(
    StyleType style, {
    required Widget child,
  }) {
    switch (style) {
      case StyleType.glass:
        return GlassCluster(child: child);
      case StyleType.neo:
        return NeoCluster(child: child);
      case StyleType.brut:
        return BrutCluster(child: child);
    }
  }

  // Cluster
  static AppBackground background(
    StyleType style,
  ) {
    switch (style) {
      case StyleType.glass:
        return const GlassBackground();
      case StyleType.neo:
        return const NeoBackground();
      case StyleType.brut:
        return const BrutBackground();
    }
  }

  // Title
  static AppTitle title(
    StyleType style, {
    required String icon,
    required String title,
  }) {
    switch (style) {
      case StyleType.glass:
        return GlassTitle(
          title: title,
          icon: icon,
        );
      case StyleType.neo:
        return NeoTitle(
          title: title,
          icon: icon,
        );
      case StyleType.brut:
        return BrutTitle(
          title: title,
          icon: icon,
        );
    }
  }
}
