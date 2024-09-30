import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/exception/base_exception.dart';
import '../../router/route_helper.dart';

mixin ScreenUtilMixin {
  void showError(BuildContext context, {Object? exception}) {
    assert(exception is BaseException, '''
    `exception` is not a subtype of [BaseException].
    ''');
    final message = (exception as BaseException).message;
    context.push(AppRoute.errorDialog.path, extra: message);
  }
}
