import 'package:flutter_boilerplate/data/response/user/user_response.dart';
import 'package:fpdart/fpdart.dart';

import '../../repositories/user/user_repository.dart';
import 'user_use_case.dart';

class UserUseCaseImpl implements UserUseCase {
  final UserRepository repository;

  UserUseCaseImpl(this.repository);

  @override
  Future<Either<Exception, UserResponse>> fetchUsers() async {
    return await repository.fetchUsers();
  }
}
