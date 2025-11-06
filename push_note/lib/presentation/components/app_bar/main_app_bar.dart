import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/gen/strings.g.dart';
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
            style: BodyTextStyle.appBarTextStyle.copyWith(color: theme.textTheme.bodyMedium?.color),
          ),
          MenuAnchor(
            alignmentOffset: const Offset(-90, 0),
            builder: (BuildContext context, MenuController controller, Widget? child) {
              return IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: theme.textTheme.bodyMedium?.color,
                ),
                onPressed: () => controller.open(),
              );
            },
            style: MenuStyle(
              shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              backgroundColor: WidgetStateProperty.all(theme.cardColor),
            ),
            menuChildren: [
              _Button(
                onPressed: () => context.go(AppRoutes.scheduled),
                text: t.scheduled,
              ),
              _Button(
                onPressed: () => context.go(AppRoutes.history),
                text: t.history,
              ),
              _Button(
                onPressed: () => context.go(AppRoutes.settings),
                text: t.settings,
              ),
            ],
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const _Button({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return MenuItemButton(
      onPressed: onPressed,
      style: ButtonStyle(overlayColor: WidgetStatePropertyAll(theme.hoverColor)),
      child: SizedBox(
        width: 100,
        child: Text(
          text,
          style: BodyTextStyle.typeTextStyle.copyWith(color: theme.textTheme.labelMedium?.color),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
