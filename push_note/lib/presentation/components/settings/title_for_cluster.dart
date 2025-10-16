import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:push_note/const/styles.dart';

class TitleForCluster extends StatelessWidget {
  final String icon;
  final String title;
  const TitleForCluster({required this.icon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: Row(
        children: [
          SvgPicture.asset(icon, width: 24, height: 24),
          const SizedBox(width: 12),
          Text(
            title,
            style: RobotoTextStyle.middle,
          )
        ],
      ),
    );
  }
}
