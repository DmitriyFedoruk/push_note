import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/components/menu_button.dart';
import 'package:push_note/routing/app_routes.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.appName,
            style: DMSerifTextStyle.appBarTextStyle.copyWith(color: theme.textTheme.bodyMedium?.color),
          ),
          MenuButton(
            options: [
              CustomMenuItemButton(
                onPressed: () => context.go(AppRoutes.scheduled),
                text: t.scheduled,
              ),
              CustomMenuItemButton(
                onPressed: () => context.go(AppRoutes.history),
                text: t.history,
              ),
              CustomMenuItemButton(
                onPressed: () => context.go(AppRoutes.settings),
                text: t.settings,
              ),
            ],
            offset: const Offset(-90, 0),
            child: Icon(
              Icons.more_vert,
              color: theme.textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
