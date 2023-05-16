import 'package:freezed_annotation/freezed_annotation.dart';

part 'school_analysis.freezed.dart';

part 'school_analysis.g.dart';

@freezed
class SchoolAnalysis with _$SchoolAnalysis {
  const factory SchoolAnalysis({
    @JsonKey(name: 'prevention_level') int? preventionLevel,
    @JsonKey(name: 'emergency_response_level') int? emergencyResponseLevel,
    @JsonKey(name: 'recovery_level') int? recoveryLevel,
  }) = _SchoolAnalysis;

  factory SchoolAnalysis.fromJson(Map<String, Object?> json) =>
      _$SchoolAnalysisFromJson(json);
}
