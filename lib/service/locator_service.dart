import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/datasource/remote/user/user_remote_datasource_impl.dart';
import 'package:flutter_boilerplate/service/session_manager.dart';
import 'package:get_it/get_it.dart';

import '../data/datasource/remote/user/user_remote_datasource.dart';
import '../data/repository/user/user_repository_impl.dart';
import '../domain/repositories/user/user_repository.dart';
import '../domain/use_cases/user/user_use_case.dart';
import '../domain/use_cases/user/user_use_case_impl.dart';

class LocatorService {
  bool _isInitialized = false;

  void initialize() {
    assert(
      !_isInitialized,
      '''
        This class is only invoked on the first run of the app.
        Do not call this multiple times.
        ${StackTrace.current}
        ''',
    );
    final dio = GetIt.I.registerSingleton(Dio());
    GetIt.I
        .registerFactory<UserDatasource>(() => UserRemoteDatasourceImpl(dio));
    GetIt.I.registerFactory<UserRepository>(
      () => UserRepositoryImpl(
        GetIt.I.get<UserDatasource>(),
      ),
    );
    GetIt.I.registerFactory<UserUseCase>(
      () => UserUseCaseImpl(
        GetIt.I.get<UserRepository>(),
      ),
    );
    GetIt.I.registerLazySingleton(() => SessionManager());
    _isInitialized = true;
  }
}
