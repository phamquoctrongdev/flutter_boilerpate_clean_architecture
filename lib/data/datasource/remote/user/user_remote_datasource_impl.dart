import 'package:flutter_boilerplate/common/error/user_error.dart';
import 'package:flutter_boilerplate/data/network_client.dart';
import 'package:flutter_boilerplate/data/response/base_response.dart';
import 'package:flutter_boilerplate/data/response/user/user_response.dart';
import 'package:fpdart/fpdart.dart';

import '../api_endpoint.dart';
import 'user_remote_datasource.dart';

class UserRemoteDatasourceImpl extends NetworkClient implements UserDatasource {
  UserRemoteDatasourceImpl(super.dio);

  @override
  Future<Either<Exception, BaseResponse<UserResponse>>> fetchUsers() async {
    return call(
      endpoint: APIEndpoint.users,
      method: NetworkMethod.get,
      onSuccess: (response) {
        return UserResponse.fromJson(response.data);
      },
      onError: (err) {
        return UserError(err);
      },
    );
  }
}
