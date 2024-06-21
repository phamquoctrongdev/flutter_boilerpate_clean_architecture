// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseImpl _$$UserResponseImplFromJson(Map<String, dynamic> json) =>
    _$UserResponseImpl(
      currentPage: (json['current_page'] as num?)?.toInt() ?? -1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? -1,
      perPage: (json['per_page'] as num?)?.toInt() ?? -1,
      total: (json['total'] as num?)?.toInt() ?? -1,
      users: (json['data'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserResponseImplToJson(_$UserResponseImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'data': instance.users,
    };
