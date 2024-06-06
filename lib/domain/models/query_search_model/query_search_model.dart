import 'package:freezed_annotation/freezed_annotation.dart';
part 'query_search_model.g.dart';

@JsonSerializable()
class QuerySearchModel {
  @JsonKey(name: 's')
  String? search;
  int? page;
  int? limit;
  QuerySearchModel({
    this.search,
    this.page,
    this.limit,
  });

  factory QuerySearchModel.fromJson(Map<String, dynamic> json) =>
      _$QuerySearchModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuerySearchModelToJson(this);
}
