import 'package:flutter/material.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/gen/strings.g.dart';

class SettingsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SettingsAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  Widget build(BuildContext context) {
    final color = context.theme.cardColor;
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        t.settings,
        style: DMSerifTextStyle.appBarTextStyle.copyWith(color: color),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
