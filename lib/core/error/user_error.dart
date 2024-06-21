import 'package:flutter_boilerplate/core/error/api_error.dart';

class UserError extends ApiError {
  UserError(super.response);

  @override
  String get message {
    final statusCode = response.statusCode;
    final errorCode = response.data['error_code'];
    assert(statusCode == 400 && errorCode != null);
    // TODO: Return specific text.
    if (errorCode == 1) {
      return 'USER_ERROR_MESSAGE_1';
    } else if (errorCode == 2) {
      return 'USER_ERROR_MESSAGE_2';
    }
    return 'USER_ERROR_MESSAGE_DEFAULT';
  }
}
