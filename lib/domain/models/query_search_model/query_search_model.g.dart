// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuerySearchModel _$QuerySearchModelFromJson(Map<String, dynamic> json) =>
    QuerySearchModel(
      search: json['s'] as String?,
      page: json['page'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$QuerySearchModelToJson(QuerySearchModel instance) =>
    <String, dynamic>{
      's': instance.search,
      'page': instance.page,
      'limit': instance.limit,
    };
