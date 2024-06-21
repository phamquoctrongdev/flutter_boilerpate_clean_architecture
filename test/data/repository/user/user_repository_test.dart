import 'package:flutter_boilerplate/data/datasource/remote/user/user_remote_datasource_impl.dart';
import 'package:flutter_boilerplate/data/repository/user/user_repository_impl.dart';
import 'package:flutter_boilerplate/data/response/user/user_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserRemoteDatasourceImpl>()])
void main() {
  group('UserRepository', () {
    final mockDataSource = MockUserRemoteDatasourceImpl();
    final repository = UserRepositoryImpl(mockDataSource);
    const mockDataSuccess = Right<Exception, UserResponse>(
      UserResponse(),
    );
    final mockDataException = Left<Exception, UserResponse>(Exception());

    test('Fetch success', () async {
      provideDummy<Either<Exception, UserResponse>>(mockDataSuccess);
      when(mockDataSource.fetchUsers())
          .thenAnswer((realInvocation) async => mockDataSuccess);
      final actual = await repository.fetchUsers();
      expect(actual, isA<Right>());
    });

    test('Fetch error', () async {
      provideDummy<Either<Exception, UserResponse>>(mockDataException);
      when(mockDataSource.fetchUsers())
          .thenAnswer((realInvocation) async => mockDataException);
      final actual = await repository.fetchUsers();
      expect(actual, isA<Left>());
    });
  });
}
