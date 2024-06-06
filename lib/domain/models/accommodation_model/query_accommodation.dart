import 'package:json_annotation/json_annotation.dart';
part 'query_accommodation.g.dart';
@JsonSerializable()
class QueryAccommodation {
  double? latitude;
  double? longitude;
  int? radius;
  int? page;
  int? limit;

  QueryAccommodation(
      {this.latitude, this.limit, this.longitude, this.page, this.radius});

  factory QueryAccommodation.fromJson(Map<String, dynamic> json) =>
      _$QueryAccommodationFromJson(json);
  Map<String, dynamic> toJson() => _$QueryAccommodationToJson(this);
}
