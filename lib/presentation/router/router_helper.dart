enum AppRoute {
  user,
  userDetail,
  profile,
}

enum AppChildRoute {
  detail,
}

extension AppRouteHelper on AppRoute {
  String get path {
    return switch (this) {
      AppRoute.user => '/user',
      AppRoute.userDetail => AppChildRoute.detail.convertFullPath('/user'),
      AppRoute.profile => '/profile',
    };
  }

  String get name {
    return switch (this) {
      AppRoute.user => 'User',
      AppRoute.userDetail => 'UserDetail',
      AppRoute.profile => 'Profile',
    };
  }
}

extension AppChildRouteHelper on AppChildRoute {
  String get path {
    return switch (this) {
      AppChildRoute.detail => 'detail',
    };
  }

  String get name {
    return switch (this) {
      AppChildRoute.detail => 'Profile',
    };
  }

  String convertFullPath(String parent) {
    return '$parent/$path';
  }
}
