import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tetenger_bumi/common/models/position.dart';

import 'school_analysis.dart';

part 'school.freezed.dart';

part 'school.g.dart';

@freezed
class School with _$School {
  const factory School({
    required int id,
    required String name,
    required SchoolAnalysis analysis,
    required Position centroid,
    String? cover,
    @JsonKey(name: 'allow_edit', defaultValue: false) required bool allowEdit,
  }) = _School;

  factory School.fromJson(Map<String, Object?> json) => _$SchoolFromJson(json);
}
