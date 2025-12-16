import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/color_extension.dart';

class UniversalTitle extends StatelessWidget {
  final String icon;
  final String title;
  const UniversalTitle({required this.icon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            colorFilter: AppColors.brutText.toFilter,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: RobotoTextStyle.middle.copyWith(color: AppColors.brutText),
          )
        ],
      ),
    );
  }
}
