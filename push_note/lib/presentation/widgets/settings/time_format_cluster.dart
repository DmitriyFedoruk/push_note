import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/widgets/settings/custom_radio_button.dart';
import 'package:push_note/presentation/widgets/settings/tap_sector.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/presentation/widgets/universal_cluster.dart';
import 'package:push_note/presentation/widgets/universal_title.dart';

class TimeFormatCluster extends StatelessWidget {
  const TimeFormatCluster({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      children: [
        UniversalTitle(icon: AppIcons.timeFormat, title: t.timeFormat),
        const UniversalCluster(
          padding: 14,
          child: _OptionsList(),
        ),
      ],
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList();

  @override
  Widget build(BuildContext context) {
    return Selector<SettingsProvider, TimeFormatType>(
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
        });
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
    return UniversalCluster(
      padding: 10,
      child: Text(
        text,
        style: RobotoTextStyle.small_12,
      ),
    );
  }
}
