import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const RootScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          indicatorColor: Colors.transparent,
          onDestinationSelected: navigationShell.goBranch,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.bar_chart),
              label: 'Statistic',
            ),
            NavigationDestination(
              icon: Icon(Icons.schedule_rounded),
              label: 'Scheduled',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_box_rounded),
              label: 'Create',
            ),
            NavigationDestination(
              icon: Icon(Icons.format_list_bulleted_rounded),
              label: 'History',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ]),
    );
  }
}

// class RootScreen extends StatefulWidget {
//   const RootScreen({super.key});

//   @override
//   State<RootScreen> createState() => _RootScreenState();
// }

// class _RootScreenState extends State<RootScreen> {
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: switch (_selectedIndex) {
//         0 => const SizedBox(),
//         1 => const ScheduledScreen(),
//         2 => const MainScreen(),
//         3 => const HistoryScreen(),
//         4 => const SettingsScreen(),
//         int() => const SizedBox(),
//       },
//       bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.shifting,
//           selectedItemColor: Colors.green,
//           unselectedItemColor: Colors.grey,
//           backgroundColor: Colors.blue,
//           currentIndex: _selectedIndex,
//           onTap: (value) {
//             setState(() {
//               _selectedIndex = value;
//             });
//           },
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.bar_chart),
//               label: 'Statistic',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.schedule_rounded),
//               label: 'Scheduled',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.add_box_rounded),
//               label: 'Create',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.format_list_bulleted_rounded),
//               label: 'History',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.settings),
//               label: 'Settings',
//             ),
//           ]),
//     );
//   }
// }
