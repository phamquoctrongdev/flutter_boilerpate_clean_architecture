import 'dart:async';

import 'package:flutter_boilerplate_clean_architecture/data/response/user/user_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/use_cases/user/user_use_case.dart';

final userProvider = AsyncNotifierProvider<UserController, UserResponse>(
  () {
    return UserController(
      GetIt.I.get<UserUseCase>(),
    );
  },
);

class UserController extends AsyncNotifier<UserResponse> {
  final UserUseCase useCase;

  UserController(this.useCase);

  @override
  Future<UserResponse> build() async {
    final response = await useCase.fetchUsers();
    return response.fold(
      (l) {
        state = AsyncError(l, StackTrace.current);
        return const UserResponse();
      },
      (r) {
        return r.data;
      },
    );
  }
}
