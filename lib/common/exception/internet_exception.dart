import 'package:flutter_boilerplate_clean_architecture/common/exception/base_exception.dart';

class InternetException extends BaseException {
  InternetException(super.dioException);

  @override
  String get message => 'Internet has an error';
}
