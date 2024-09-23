enum AppRoute {
  user,
  userDetail,
  theme,
  errorDialog,
}

enum AppChildRoute {
  detail,
}

extension AppRouteHelper on AppRoute {
  String get path {
    return switch (this) {
      AppRoute.user => '/user',
      AppRoute.userDetail => AppChildRoute.detail.convertFullPath('/user'),
      AppRoute.theme => '/profile',
      AppRoute.errorDialog => '/error_dialog',
    };
  }

  String get name {
    return switch (this) {
      AppRoute.user => 'User',
      AppRoute.userDetail => 'UserDetail',
      AppRoute.theme => 'Profile',
      AppRoute.errorDialog => 'ErrorDialog',
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
