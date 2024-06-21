import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../ui/main_home/view/main_home_page.dart';
import '../ui/user/view/user_detail_screen.dart';
import '../ui/user/view/user_screen.dart';

class AppRouter {
  static const String detail = 'detail';

  static const String user = '/user';
  static const String userDetail = '/user/detail';

  static const String profileChildTemp = '/profile_child_temp';

  static final routerConfig = GoRouter(
    initialLocation: user,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainHomePage(child: child);
        },
        routes: [
          GoRoute(
            path: user,
            builder: (context, state) {
              return const UserScreen();
            },
            routes: [
              GoRoute(
                path: detail,
                builder: (context, state) {
                  return UserDetailScreen(text: state.extra as String);
                },
              ),
            ],
          ),
          GoRoute(
            path: profileChildTemp,
            builder: (context, state) {
              return const Center(
                child: Text(
                  'Profile child temp',
                  key: Key('MyTextKey'),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
