import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:push_note/presentation/screens/history_screen.dart';
import 'package:push_note/presentation/screens/main_screen.dart';
import 'package:push_note/routing/app_routes.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.root,
      builder: (BuildContext context, GoRouterState state) {
        return const MainScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.history,
          builder: (BuildContext context, GoRouterState state) {
            return const HistoryScreen();
          },
        ),
      ],
    ),
  ],
);
