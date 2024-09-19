import 'api_error.dart';

class UserError extends ApiError {
  UserError(super.exception);

  @override
  String get message {
    // final statusCode = exception.response?.statusCode ?? -1;
    // final errorCode = exception.response?.data['error_code'];
    // assert(statusCode >= 300 && errorCode != null);
    // if (errorCode == 1) {
    //   return 'USER_ERROR_MESSAGE_1';
    // } else if (errorCode == 2) {
    //   return 'USER_ERROR_MESSAGE_2';
    // }
    return 'USER_ERROR_MESSAGE_DEFAULT';
  }
}
