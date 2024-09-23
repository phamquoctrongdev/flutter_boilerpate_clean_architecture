import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/exception/base_exception.dart';
import 'package:flutter_boilerplate/presentation/router/router_helper.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtension on BuildContext {
  void showErrorDialog(Object? exception) {
    assert(exception is BaseException, '''
    `exception` is not a subtype of [BaseException].
    ''');
    final message = (exception as BaseException).message;
    push(AppRoute.errorDialog.path, extra: message);
  }
}
