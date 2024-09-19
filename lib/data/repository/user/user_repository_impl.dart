import 'package:flutter_boilerplate/data/response/user/user_response.dart';
import 'package:fpdart/fpdart.dart';

import '../../../domain/repositories/user/user_repository.dart';
import '../../datasource/remote/user/user_remote_datasource.dart';
import '../../response/base_response.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource datasource;

  UserRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, BaseResponse<UserResponse>>> fetchUsers() {
    return datasource.fetchUsers();
  }
}
