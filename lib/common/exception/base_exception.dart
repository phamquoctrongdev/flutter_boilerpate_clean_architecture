abstract class BaseException implements Exception {
  final Exception exception;

  BaseException(this.exception);

  String get message;

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}
