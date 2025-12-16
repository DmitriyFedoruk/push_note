import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/color_extension.dart';
import 'package:push_note/presentation2/widgets/base/app_title.dart';

class GlassTitle extends AppTitle {
  const GlassTitle({
    required super.icon,
    required super.title,
    super.key,
  });

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
            colorFilter: AppColors.glassText.toFilter,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: RobotoTextStyle.middle.copyWith(color: AppColors.glassText),
          )
        ],
      ),
    );
  }
}
