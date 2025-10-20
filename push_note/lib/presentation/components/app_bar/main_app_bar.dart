import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/routing/app_routes.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.appName,
            style: BodyTextStyle.appBarTextStyle,
          ),
          PopupMenuButton(
            padding: const EdgeInsets.all(12),
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.white,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: _Options.scheduled,
                  onTap: () => context.go(AppRoutes.scheduled),
                  child: Text(
                    AppStrings.scheduled,
                    style: BodyTextStyle.typeTextStyle,
                  ),
                ),
                PopupMenuItem(
                  value: _Options.history,
                  onTap: () => context.go(AppRoutes.history),
                  child: Text(
                    AppStrings.history,
                    style: BodyTextStyle.typeTextStyle,
                  ),
                ),
                PopupMenuItem(
                  value: _Options.settings,
                  onTap: () => context.go(AppRoutes.settings),
                  child: Text(
                    AppStrings.settings,
                    style: BodyTextStyle.typeTextStyle,
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}

enum _Options { scheduled, history, settings }
