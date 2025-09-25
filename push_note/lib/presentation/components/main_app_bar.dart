import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:push_note/const/colors.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles.dart';
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
          IconButton(
            onPressed: () => context.go(AppRoutes.history),
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.white,
            ),
          )
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
