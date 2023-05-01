import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:school_watch_semeru/features/school/domain/school_analysis.dart';

part 'school.freezed.dart';

part 'school.g.dart';

@freezed
class School with _$School {
  const factory School({
    required String id,
    required String name,
    required SchoolAnalysis analysis,
    String? image,
  }) = _School;

  factory School.fromJson(Map<String, Object?> json) => _$SchoolFromJson(json);
}
