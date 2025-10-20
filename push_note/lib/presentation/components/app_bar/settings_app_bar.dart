import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/routing/app_routes.dart';

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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              context.go(AppRoutes.root);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 32,
              color: color,
            ),
          ),
          Text(
            AppStrings.settings,
            style: BodyTextStyle.appBarTextStyle.copyWith(color: color),
          ),
          const SizedBox(
            width: 48,
          )
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
