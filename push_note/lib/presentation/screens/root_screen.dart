import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/gen/strings.g.dart';

class RootScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const RootScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          indicatorColor: theme.splashColor,
          onDestinationSelected: navigationShell.goBranch,
          backgroundColor: Colors.white,
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.bar_chart,
                color: theme.primaryColor,
              ),
              icon: Icon(
                Icons.bar_chart,
                color: theme.cardColor,
              ),
              label: t.progress,
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.timer,
                color: theme.primaryColor,
              ),
              icon: Icon(
                Icons.timer,
                color: theme.cardColor,
              ),
              label: t.scheduled,
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.add_box_sharp,
                color: theme.primaryColor,
              ),
              icon: Icon(
                Icons.add_box_sharp,
                color: theme.cardColor,
              ),
              label: t.create,
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.task_sharp,
                color: theme.primaryColor,
              ),
              icon: Icon(
                Icons.task_sharp,
                color: theme.cardColor,
              ),
              label: t.history,
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.account_box_sharp,
                color: theme.primaryColor,
              ),
              icon: Icon(
                Icons.account_box_sharp,
                color: theme.cardColor,
              ),
              label: t.settings,
            ),
          ]),
    );
  }
}
