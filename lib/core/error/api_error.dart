import 'package:dio/dio.dart';

class ApiError implements Exception {
  final Response response;

  ApiError(this.response);

  String get message {
    switch (response.statusCode) {
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
    return '$this: $message';
  }
}
