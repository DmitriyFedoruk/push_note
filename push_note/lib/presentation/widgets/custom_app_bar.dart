import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/presentation2/colors_resolver.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbar(this.title, {super.key});

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  Widget build(BuildContext context) {
    final style = context.select((SettingsProvider prov) => prov.styleType);
    final color = ColorsResolver.textColor(style);
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: DMSerifTextStyle.appBarTextStyle.copyWith(color: color),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
