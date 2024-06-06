import 'package:freezed_annotation/freezed_annotation.dart';
part 'query_model.g.dart';

@JsonSerializable()
class QueryModel {
  int? page;
  int? limit;

  QueryModel({this.page, this.limit});

  factory QueryModel.fromJson(Map<String, dynamic> json) =>
      _$QueryModelFromJson(json);
  Map<String, dynamic> toJson() => _$QueryModelToJson(this);
}
