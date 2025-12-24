import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Selector<SettingsProvider, BackgroundType>(
          selector: (_, s) => s.backgroundType,
          builder: (context, backType, _) {
            return SvgPicture.asset(
              backType.path,
              fit: BoxFit.fill,
            );
          }),
    );
  }
}
