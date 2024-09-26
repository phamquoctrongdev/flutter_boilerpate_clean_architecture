import 'package:flutter_boilerplate_clean_architecture/data/repository/user/user_repository_impl.dart';
import 'package:flutter_boilerplate_clean_architecture/data/response/base_response.dart';
import 'package:flutter_boilerplate_clean_architecture/data/response/pagination_response.dart';
import 'package:flutter_boilerplate_clean_architecture/data/response/user/user_response.dart';
import 'package:flutter_boilerplate_clean_architecture/domain/use_cases/user/user_use_case_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserRepositoryImpl>()])
void main() {
  group('Run test [UserUseCase]', () {
    final mockRepository = MockUserRepositoryImpl();
    final useCase = UserUseCaseImpl(mockRepository);
    final mockRepositorySuccess =
        Right<Exception, BaseResponse<UserResponse>>(BaseResponse(
      const UserResponse(),
      pagination: const PaginationResponse(),
    ));
    final mockRepositoryFailed =
        Left<Exception, BaseResponse<UserResponse>>(Exception());

    test('Run test: Fetch success', () async {
      // Mock the call [repository.fetchUsers] will return a type of Right<Exception, List<UserResponse>>.
      provideDummy<Either<Exception, BaseResponse<UserResponse>>>(
          mockRepositorySuccess);
      when(mockRepository.fetchUsers())
          .thenAnswer((realInvocation) async => mockRepositorySuccess);
      final repositoryResult = await mockRepository.fetchUsers();
      expect(repositoryResult, isA<Right>());
      expect(
          repositoryResult.fold((l) => l, (r) => r), isA<List<UserResponse>>());

      // Check the result will return List<UserResponse>.
      final actual = await useCase.fetchUsers();
      expect(actual, isA<Right>());
      expect(actual.fold((l) => l, (r) => r), isA<List<UserResponse>>());
    });

    test('Run test: Fetch failed', () async {
      // Mock the call [repository.fetchUsers] will return a type of Left<Exception, List<UserResponse>>.
      when(mockRepository.fetchUsers())
          .thenAnswer((realInvocation) async => mockRepositoryFailed);
      final repositoryResult = await mockRepository.fetchUsers();
      expect(repositoryResult, isA<Left>());
      expect(repositoryResult.fold((l) => l, (r) => r), isA<Exception>());

      // Check the result is throw Exception.
      final actual = await useCase.fetchUsers();
      expect(actual, isA<Left>());
      expect(actual.fold((l) => l, (r) => r), isA<Exception>());
    });
  });
}
