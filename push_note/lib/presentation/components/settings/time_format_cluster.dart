import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/presentation/components/settings/widgets/custom_radio_button.dart';
import 'package:push_note/presentation/components/settings/widgets/tap_sector.dart';
import 'package:push_note/presentation/components/settings/widgets/title_for_cluster.dart';
import 'package:push_note/presentation/components/settings/widgets/universal_cluster.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';

class TimeFormatCluster extends StatelessWidget {
  const TimeFormatCluster({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TitleForCluster(icon: AppIcons.timeFormat, title: AppStrings.timeFormat),
        UniversalCluster(
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
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Selector<SettingsProvider, TimeFormatType>(
            selector: (_, s) => s.timeFormatType,
            builder: (context, timeFormatType, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _OneItem(
                    type: TimeFormatType.hours12,
                    activeType: timeFormatType,
                  ),
                  _OneItem(
                    type: TimeFormatType.hours24,
                    activeType: timeFormatType,
                  ),
                ],
              );
            }));
  }
}

class _OneItem extends StatelessWidget {
  final TimeFormatType type;
  final TimeFormatType activeType;
  const _OneItem({
    required this.type,
    required this.activeType,
  });

  @override
  Widget build(BuildContext context) {
    return TapSector(
      onTap: () => context.read<SettingsProvider>().setTimeFormatType(type),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Cluster(
            text: type == TimeFormatType.hours24
                ? AppStrings.format24HoursDefaultData
                : AppStrings.format12HoursDefaultData,
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
