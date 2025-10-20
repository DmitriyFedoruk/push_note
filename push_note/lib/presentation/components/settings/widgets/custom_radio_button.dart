import 'package:flutter/material.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/extensions/theme_extension.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isActive;
  const CustomRadioButton({required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      child: isActive ? const _ActiveRadio() : const _InActiveRadio(),
    );
  }
}

class _ActiveRadio extends StatelessWidget {
  const _ActiveRadio();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 1.0, color: theme.cardColor)),
      padding: const EdgeInsets.all(4),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(shape: BoxShape.circle, color: theme.cardColor),
      ),
    );
  }
}

class _InActiveRadio extends StatelessWidget {
  const _InActiveRadio();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 1.0, color: AppColors.inactiveColor)),
    );
  }
}
