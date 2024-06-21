import 'package:flutter_boilerplate/data/response/user/user_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserUseCase {
  Future<Either<Exception, UserResponse>> fetchUsers();
}
