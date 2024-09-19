import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/router/router_helper.dart';
import 'package:go_router/go_router.dart';

import '../ui/main_home/view/main_home_page.dart';
import '../ui/user/view/user_detail_screen.dart';
import '../ui/user/view/user_screen.dart';

class AppRouter {
  static final routerConfig = GoRouter(
    initialLocation: AppRoute.user.path,
    routes: [
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) {
          return CustomTransitionPage(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return RotationTransition(
                turns: animation,
                child: child,
              );
            },
            child: MainHomePage(shell: navigationShell),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.user.path,
                builder: (context, state) {
                  return const UserScreen();
                },
                routes: [
                  GoRoute(
                    path: AppChildRoute.detail.path,
                    builder: (context, state) {
                      return UserDetailScreen(text: state.extra as String);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.profile.path,
                builder: (context, state) {
                  return const Scaffold(
                    backgroundColor: Colors.green,
                    body: Center(child: Text('Child')),
                  );
                },
              ),
            ],
          )
        ],
      ),
    ],
  );
}
