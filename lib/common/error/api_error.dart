import 'package:dio/dio.dart';

class ApiError implements Exception {
  final DioException exception;

  ApiError(this.exception);

  // TODO: Handle to return specific message.
  String get message {
    assert(exception.response != null);
    switch (exception.response!.statusCode) {
      case 400:
        return 'ERROR_400';
      case 401:
        return 'ERROR_401';
      case 500:
        return 'ERROR_500';
      default:
        return 'ERROR_DEFAULT';
    }
  }

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}
