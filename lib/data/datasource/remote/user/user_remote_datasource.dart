import 'package:flutter_boilerplate_clean_architecture/data/response/base_response.dart';
import 'package:flutter_boilerplate_clean_architecture/data/response/user/user_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserDatasource {
  Future<Either<Exception, BaseResponse<UserResponse>>> fetchUsers();
}
