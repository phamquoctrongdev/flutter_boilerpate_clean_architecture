import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/data/datasource/remote/user/user_remote_datasource.dart';
import 'package:flutter_boilerplate/domain/repositories/user/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/remote/user/user_remote_datasource_impl.dart';
import 'data/repository/user/user_repository_impl.dart';
import 'domain/use_cases/user/user_use_case.dart';
import 'domain/use_cases/user/user_use_case_impl.dart';
import 'gen/fonts.gen.dart';
import 'presentation/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

void configureDependencies() {
  final locator = GetIt.I;
  final dio = locator.registerSingleton(Dio());
  locator.registerFactory<UserDatasource>(() => UserRemoteDatasourceImpl(dio));
  locator.registerFactory<UserRepository>(
    () => UserRepositoryImpl(
      locator.get<UserDatasource>(),
    ),
  );
  locator.registerFactory<UserUseCase>(
    () => UserUseCaseImpl(
      locator.get<UserRepository>(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: FontFamily.mavenPro,
        ),
        routerConfig: AppRouter.routerConfig,
      ),
    );
  }
}
