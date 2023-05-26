import 'package:freezed_annotation/freezed_annotation.dart';

part 'school_analysis.freezed.dart';

part 'school_analysis.g.dart';

@freezed
class SchoolAnalysis with _$SchoolAnalysis {
  const factory SchoolAnalysis({
    @JsonKey(name: 'prevention_level') double? preventionLevel,
    @JsonKey(name: 'emergency_response_level') double? emergencyResponseLevel,
    @JsonKey(name: 'recovery_level') double? recoveryLevel,
  }) = _SchoolAnalysis;

  factory SchoolAnalysis.fromJson(Map<String, Object?> json) =>
      _$SchoolAnalysisFromJson(json);
}
