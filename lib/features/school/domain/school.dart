import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/models/position.dart';
import 'school_analysis.dart';

part 'school.freezed.dart';

part 'school.g.dart';

@freezed
class School with _$School {
  const factory School({
    required String id,
    required String name,
    required SchoolAnalysis analysis,
    @JsonKey(name: 'school_location') required Position schoolLocation,
    String? image,
  }) = _School;

  factory School.fromJson(Map<String, Object?> json) => _$SchoolFromJson(json);
}
