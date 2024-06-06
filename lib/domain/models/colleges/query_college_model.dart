import 'package:json_annotation/json_annotation.dart';
part 'query_college_model.g.dart';

@JsonSerializable()
class QueryCollegeModel {
  @JsonKey(name: 's')
  String? search;
  int? page;
  int? limit;
  @JsonKey(name: 'course')
  int? courseId;
  @JsonKey(name: 'university')
  int? universityId;
  @JsonKey(name: 'city')
  String? placeName;
  QueryCollegeModel(
      {this.search, this.page, this.limit, this.courseId, this.universityId,this.placeName});

  factory QueryCollegeModel.fromJson(Map<String, dynamic> json) =>
      _$QueryCollegeModelFromJson(json);
  Map<String, dynamic> toJson() => _$QueryCollegeModelToJson(this);
}
