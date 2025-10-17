import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/presentation/components/settings/custom_radio_button.dart';
import 'package:push_note/presentation/components/settings/title_for_cluster.dart';
import 'package:push_note/presentation/components/settings/universal_cluster.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';

class BackgroundCluster extends StatelessWidget {
  const BackgroundCluster({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TitleForCluster(icon: AppIcons.background, title: AppStrings.background),
        UniversalCluster(_BackgroundsList())
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: SizedBox(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_OneImage(image), const SizedBox(height: 12), CustomRadioButton(isActive: isActive)],
            ),
          ),
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
