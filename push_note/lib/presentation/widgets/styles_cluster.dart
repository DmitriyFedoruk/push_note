import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/glassmorhic/components/settings/widgets/custom_radio_button.dart';
import 'package:push_note/presentation/glassmorhic/components/settings/widgets/tap_sector.dart';
import 'package:push_note/presentation/glassmorhic/components/settings/widgets/title_for_cluster.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/presentation/widgets/custom_card.dart';
import 'package:push_note/presentation/widgets/universal_cluster.dart';

class StylesCluster extends StatelessWidget {
  const StylesCluster({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      children: [TitleForCluster(icon: AppIcons.background, title: t.theme), const UniversalCluster(_StylesList())],
    );
  }
}

class _StylesList extends StatelessWidget {
  const _StylesList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Selector<SettingsProvider, StyleType>(
          selector: (_, s) => s.styleType,
          builder: (_, type, __) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _OneItem(
                  StyleType.glassmorphic,
                  isActive: type == StyleType.glassmorphic,
                  onTap: () => context.read<SettingsProvider>().setStyleType(StyleType.glassmorphic),
                ),
                _OneItem(
                  StyleType.neumorphic,
                  isActive: type == StyleType.neumorphic,
                  onTap: () => context.read<SettingsProvider>().setStyleType(StyleType.neumorphic),
                ),
                _OneItem(
                  StyleType.brutalism,
                  isActive: type == StyleType.brutalism,
                  onTap: () => context.read<SettingsProvider>().setStyleType(StyleType.brutalism),
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
  final VoidCallback onTap;
  const _OneItem(
    this.styleType, {
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TapSector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCard(
            styleType: styleType,
            note: Note(
              title: 'fddf',
              createdAt: DateTime.now(),
              scheduledDate: null,
            ),
            timeFormatType: TimeFormatType.hours24,
          ),
          const SizedBox(height: 12),
          CustomRadioButton(isActive: isActive)
        ],
      ),
    );
  }
}
