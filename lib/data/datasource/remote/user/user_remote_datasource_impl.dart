import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/error/user_error.dart';
import 'package:flutter_boilerplate/data/response/user/user_response.dart';
import 'package:fpdart/fpdart.dart';

import '../api_endpoint.dart';
import '../auth_interceptor.dart';
import 'user_remote_datasource.dart';

class UserRemoteDatasourceImpl implements UserDatasource {
  final Dio dio;

  UserRemoteDatasourceImpl(this.dio);

  @override
  Future<Either<Exception, UserResponse>> fetchUsers() async {
    try {
      const endpoint = APIEndpoint.users;
      dio.interceptors.add(AuthInterceptor());
      final response = await dio.get(endpoint);
      final result = UserResponse.fromJson(response.data);
      return Right(result);
    } on DioException catch (e) {
      final response = e.response;
      if (response != null) {
        return Left(UserError(response));
      } else {
        return Left(e);
      }
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
