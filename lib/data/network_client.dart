import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../common/error/api_error.dart';
import 'datasource/remote/auth_interceptor.dart';
import 'response/base_response.dart';
import 'response/pagination_response.dart';

enum NetworkMethod {
  get,
  post,
  put,
  patch,
  delete,
}

typedef NetworkSuccessCallBack<T> = T Function(Response response);

typedef NetworkErrorCallBack<E extends ApiError> = E Function(DioException err);

class NetworkClient {
  final Dio dio;

  NetworkClient(this.dio);

  void _addInterceptor({
    bool addAuthentication = true,
    bool addDioLog = true,
  }) {
    if (addAuthentication) {
      dio.interceptors.add(AuthInterceptor());
    }
    if (addDioLog) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
          enabled: kDebugMode,
          // Example [filter]
          // filter: (options, args) {
          //   if (options.path.contains('/posts')) {
          //     return false;
          //   }
          //   return !args.isResponse || !args.hasUint8ListData;
          // },
        ),
      );
    }
  }

  // `onError` is only called when the exception is a subtype of [DioException]
  Future<Either<Exception, BaseResponse<T>>> call<T>({
    required String endpoint,
    required NetworkMethod method,
    required NetworkSuccessCallBack<T> onSuccess,
    NetworkErrorCallBack? onError,
    bool addAuthentication = true,
    bool addDioLog = true,
  }) async {
    try {
      _addInterceptor(
        addAuthentication: addAuthentication,
        addDioLog: addDioLog,
      );
      late final Response<dynamic> response;
      switch (method) {
        case NetworkMethod.get:
          response = await dio.get(endpoint);
        case NetworkMethod.post:
          response = await dio.post(endpoint);
        case NetworkMethod.put:
          response = await dio.put(endpoint);
        case NetworkMethod.patch:
          response = await dio.patch(endpoint);
        case NetworkMethod.delete:
          response = await dio.delete(endpoint);
      }
      final result = onSuccess(response);
      final pagination = PaginationResponse.fromJson(response.data);
      return Right(
        BaseResponse(
          result,
          pagination: pagination,
        ),
      );
    } on Exception catch (e) {
      if (onError != null && e is DioException) {
        final error = onError(e);
        return Left(error);
      }
      return Left(e);
    }
  }
}
