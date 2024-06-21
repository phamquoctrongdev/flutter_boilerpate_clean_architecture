import 'package:flutter_boilerplate/data/repository/user/user_repository_impl.dart';
import 'package:flutter_boilerplate/data/response/user/user_response.dart';
import 'package:flutter_boilerplate/domain/use_cases/user/user_use_case_impl.dart';
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
    const mockRepositorySuccess = Right<Exception, UserResponse>(
      UserResponse(),
    );
    final mockRepositoryFailed = Left<Exception, UserResponse>(Exception());

    test('Run test: Fetch success', () async {
      // Mock the call [repository.fetchUsers] will return a type of Right<Exception, List<UserResponse>>.
      provideDummy<Either<Exception, UserResponse>>(mockRepositorySuccess);
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
