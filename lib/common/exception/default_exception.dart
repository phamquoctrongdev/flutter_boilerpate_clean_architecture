import 'package:flutter_boilerplate/common/exception/base_exception.dart';

class DefaultException extends BaseException {
  DefaultException(super.exception);

  @override
  String get message => 'Default exception message';
}
