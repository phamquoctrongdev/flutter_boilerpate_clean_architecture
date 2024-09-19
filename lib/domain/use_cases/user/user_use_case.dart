import 'package:flutter_boilerplate/data/response/user/user_response.dart';
import 'package:fpdart/fpdart.dart';

import '../../../data/response/base_response.dart';

abstract class UserUseCase {
  Future<Either<Exception, BaseResponse<UserResponse>>> fetchUsers();
}
