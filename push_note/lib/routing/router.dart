import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:push_note/presentation/screens/history_screen.dart';
import 'package:push_note/presentation/screens/main_screen.dart';
import 'package:push_note/presentation/screens/progress_screen.dart';
import 'package:push_note/presentation/screens/root_screen.dart';
import 'package:push_note/presentation/screens/scheduled_screen.dart';
import 'package:push_note/presentation/screens/settings_screen.dart';
import 'package:push_note/routing/app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

/// The route configuration.
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.create,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return RootScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.statistic,
                builder: (BuildContext context, GoRouterState state) {
                  return const ProgressScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.scheduled,
              builder: (BuildContext context, GoRouterState state) {
                return const ScheduledScreen();
              },
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.create,
              builder: (BuildContext context, GoRouterState state) {
                return const MainScreen();
              },
            ),
          ]),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.history,
                builder: (BuildContext context, GoRouterState state) {
                  return const HistoryScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.settings,
              builder: (BuildContext context, GoRouterState state) {
                return const SettingsScreen();
              },
            ),
          ]),
        ])
  ],
);
