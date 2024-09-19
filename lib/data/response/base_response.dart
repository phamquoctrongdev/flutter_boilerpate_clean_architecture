import 'pagination_response.dart';

class BaseResponse<T> {
  final T data;
  final PaginationResponse? pagination;

  BaseResponse(this.data, {this.pagination});
}
