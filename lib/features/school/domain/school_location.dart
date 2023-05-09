import 'package:freezed_annotation/freezed_annotation.dart';

part 'school_location.freezed.dart';

part 'school_location.g.dart';

@freezed
class SchoolLocation with _$SchoolLocation {
  const factory SchoolLocation({
    required double latitude,
    required double longitude,
  }) = _SchoolLocation;

  factory SchoolLocation.fromJson(Map<String, Object?> json) =>
      _$SchoolLocationFromJson(json);
}
