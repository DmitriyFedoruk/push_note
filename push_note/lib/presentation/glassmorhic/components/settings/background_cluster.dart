import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/glassmorhic/components/settings/widgets/custom_radio_button.dart';
import 'package:push_note/presentation/glassmorhic/components/settings/widgets/tap_sector.dart';
import 'package:push_note/presentation/widgets/universal_title.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/presentation/widgets/universal_cluster.dart';

class BackgroundCluster extends StatelessWidget {
  const BackgroundCluster({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      children: [
        UniversalTitle(icon: AppIcons.background, title: t.background),
        const UniversalCluster(_BackgroundsList())
      ],
    );
  }
}

class _BackgroundsList extends StatelessWidget {
  const _BackgroundsList();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width / 8;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Selector<SettingsProvider, AppBackgrounds>(
          selector: (_, s) => s.background,
          builder: (_, bk, __) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _OneItem(
                  AppImages.background1,
                  isActive: bk == AppBackgrounds.background1,
                  width: width,
                  onTap: () => context.read<SettingsProvider>().setBackground(AppBackgrounds.background1),
                ),
                _OneItem(
                  AppImages.background2,
                  isActive: bk == AppBackgrounds.background2,
                  width: width,
                  onTap: () => context.read<SettingsProvider>().setBackground(AppBackgrounds.background2),
                ),
                _OneItem(
                  AppImages.background3,
                  isActive: bk == AppBackgrounds.background3,
                  width: width,
                  onTap: () => context.read<SettingsProvider>().setBackground(AppBackgrounds.background3),
                )
              ],
            );
          }),
    );
  }
}

class _OneItem extends StatelessWidget {
  final String image;
  final bool isActive;
  final double width;
  final VoidCallback onTap;
  const _OneItem(
    this.image, {
    required this.isActive,
    required this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TapSector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_OneImage(image), const SizedBox(height: 12), CustomRadioButton(isActive: isActive)],
        ),
      ),
    );
  }
}

class _OneImage extends StatelessWidget {
  final String image;
  const _OneImage(
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: double.infinity,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}
