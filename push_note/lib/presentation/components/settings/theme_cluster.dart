import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/color_extension.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/components/settings/widgets/custom_radio_button.dart';
import 'package:push_note/presentation/components/settings/widgets/tap_sector.dart';
import 'package:push_note/presentation/components/settings/widgets/title_for_cluster.dart';
import 'package:push_note/presentation/components/settings/widgets/universal_cluster.dart';

class ThemeCluster extends StatelessWidget {
  const ThemeCluster({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      children: [
        TitleForCluster(icon: AppIcons.theme, title: t.theme),
        const UniversalCluster(
          _ThemesList(),
        ),
      ],
    );
  }
}

class _ThemesList extends StatelessWidget {
  const _ThemesList();

  @override
  Widget build(BuildContext context) {
    bool isLight = AdaptiveTheme.of(context).mode.isLight;

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _OneItem(
              isLight: true,
              isActive: isLight,
              onTap: () => AdaptiveTheme.of(context).setLight(),
            ),
            _OneItem(
              isLight: false,
              isActive: !isLight,
              onTap: () => AdaptiveTheme.of(context).setDark(),
            ),
          ],
        ));
  }
}

class _OneItem extends StatelessWidget {
  final bool isLight;
  final bool isActive;
  final VoidCallback onTap;
  const _OneItem({
    required this.isLight,
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
          _Menu(isLight),
          const SizedBox(height: 23),
          CustomRadioButton(isActive: isActive),
        ],
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  final bool isLight;
  const _Menu(this.isLight);

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final color = isLight ? AppColors.black : AppColors.white;
    return Container(
        width: 100,
        height: 88,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: isLight ? AppColors.white : AppColors.black,
          boxShadow: shadow(color),
        ),
        child: Column(
          children: [
            Expanded(
              child: _Point(
                icon: AppIcons.add,
                text: t.addNow,
                color: color,
              ),
            ),
            Expanded(
              child: _Point(
                icon: AppIcons.reschedule,
                text: t.reschedule,
                color: color,
              ),
            ),
            Expanded(
              child: _Point(
                icon: AppIcons.trash,
                text: t.remove,
                color: color,
              ),
            ),
          ],
        ));
  }
}

class _Point extends StatelessWidget {
  final String icon;
  final String text;
  final Color color;
  const _Point({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 16.0,
          height: 16.0,
          colorFilter: color.toFilter,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: RobotoTextStyle.small_10.copyWith(color: color),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
