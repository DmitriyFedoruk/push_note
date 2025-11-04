import 'package:flutter/material.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/components/settings/widgets/custom_radio_button.dart';
import 'package:push_note/presentation/components/settings/widgets/tap_sector.dart';
import 'package:push_note/presentation/components/settings/widgets/title_for_cluster.dart';
import 'package:push_note/presentation/components/settings/widgets/universal_cluster.dart';

class LanguageCluster extends StatelessWidget {
  const LanguageCluster({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      children: [
        TitleForCluster(icon: AppIcons.timeFormat, title: t.language),
        const UniversalCluster(
          _OptionsList(),
          height: 118,
        ),
      ],
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList();

  @override
  Widget build(BuildContext context) {
    Translations.of(context);
    final activeType = LocaleSettings.currentLocale;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _OneItem(
              type: AppLocale.en,
              activeType: activeType,
            ),
            _OneItem(
              type: AppLocale.ru,
              activeType: activeType,
            ),
          ],
        ));
  }
}

class _OneItem extends StatelessWidget {
  final AppLocale type;
  final AppLocale activeType;
  const _OneItem({
    required this.type,
    required this.activeType,
  });

  @override
  Widget build(BuildContext context) {
    return TapSector(
      onTap: () => LocaleSettings.setLocale(type),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Cluster(
            text: type == AppLocale.en ? AppStrings.english : AppStrings.russian,
          ),
          const SizedBox(height: 12),
          CustomRadioButton(isActive: type == activeType),
        ],
      ),
    );
  }
}

class _Cluster extends StatelessWidget {
  final String text;
  const _Cluster({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      width: 76.0,
      height: 26.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.cardColor,
        boxShadow: shadow(theme.shadowColor),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: RobotoTextStyle.small_12.copyWith(color: theme.textTheme.labelLarge?.color),
      ),
    );
  }
}
