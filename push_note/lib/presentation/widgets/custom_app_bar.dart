import 'package:flutter/material.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/theme_extension.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbar(this.title, {super.key});

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  Widget build(BuildContext context) {
    final color = context.theme.cardColor;
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 10, left: 12),
        child: Text(
          title,
          style: BebasTextStyle.appBarTextStyle.copyWith(color: color),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
