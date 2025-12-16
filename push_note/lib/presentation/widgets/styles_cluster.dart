import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/glassmorhic/components/settings/widgets/custom_radio_button.dart';
import 'package:push_note/presentation/glassmorhic/components/settings/widgets/tap_sector.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/presentation/widgets/universal_cluster.dart';
import 'package:push_note/presentation/widgets/universal_title.dart';
import 'package:push_note/presentation2/widgets/base/app_card.dart';
import 'package:push_note/presentation2/widgets/widget_resolver.dart';

class StylesCluster extends StatelessWidget {
  const StylesCluster({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      children: [
        UniversalTitle(icon: AppIcons.background, title: t.theme),
        const UniversalCluster(
          _StylesList(),
        )
      ],
    );
  }
}

class _StylesList extends StatelessWidget {
  const _StylesList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Selector<SettingsProvider, ({StyleType type, TimeFormatType timeFormatType})>(
          selector: (_, s) => (type: s.styleType, timeFormatType: s.timeFormatType),
          builder: (_, data, __) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _OneItem(
                  StyleType.glass,
                  isActive: data.type == StyleType.glass,
                  timeFormatType: data.timeFormatType,
                  onTap: () => context.read<SettingsProvider>().setStyleType(StyleType.glass),
                ),
                const SizedBox(height: 8),
                _OneItem(
                  StyleType.neo,
                  isActive: data.type == StyleType.neo,
                  timeFormatType: data.timeFormatType,
                  onTap: () => context.read<SettingsProvider>().setStyleType(StyleType.neo),
                ),
                const SizedBox(height: 8),
                _OneItem(
                  StyleType.brut,
                  isActive: data.type == StyleType.brut,
                  timeFormatType: data.timeFormatType,
                  onTap: () => context.read<SettingsProvider>().setStyleType(StyleType.brut),
                )
              ],
            );
          }),
    );
  }
}

class _OneItem extends StatelessWidget {
  final StyleType styleType;
  final bool isActive;
  final TimeFormatType timeFormatType;
  final VoidCallback onTap;
  const _OneItem(
    this.styleType, {
    required this.isActive,
    required this.timeFormatType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final AppCard card = WidgetResolver.card(
      styleType,
      note: Note(
        title: t.createNewTask,
        type: NotesColorsEnum.red,
        createdAt: DateTime.now(),
        scheduledDate: null,
      ),
      timeFormatType: timeFormatType,
      isScheduled: false,
    );
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Stack(
        children: [
          SizedBox(
            height: 140,
            width: double.infinity,
            child: WidgetResolver.background(styleType),
          ),
          TapSector(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                card,
                const SizedBox(height: 12),
                CustomRadioButton(isActive: isActive),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
