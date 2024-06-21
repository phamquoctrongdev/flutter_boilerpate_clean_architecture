import 'dart:async';

import 'package:flutter_boilerplate/data/response/user/user_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/use_cases/user/user_use_case.dart';

final userProvider = AsyncNotifierProvider<UserNotifier, UserResponse>(
  () {
    return UserNotifier(
      GetIt.I.get<UserUseCase>(),
    );
  },
);

class UserNotifier extends AsyncNotifier<UserResponse> {
  final UserUseCase useCase;

  UserNotifier(this.useCase);

  @override
  Future<UserResponse> build() async {
    final response = await useCase.fetchUsers();
    return response.fold(
      (l) {
        return const UserResponse();
      },
      (r) {
        return r;
      },
    );
  }
}
