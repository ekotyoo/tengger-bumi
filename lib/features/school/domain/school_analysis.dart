import 'package:freezed_annotation/freezed_annotation.dart';

part 'school_analysis.freezed.dart';

part 'school_analysis.g.dart';

@freezed
class SchoolAnalysis with _$SchoolAnalysis {
  const factory SchoolAnalysis({
    required String preventionLevel,
    required String emergencyResponseLevel,
    required String recoveryLevel,
  }) = _SchoolAnalysis;

  factory SchoolAnalysis.fromJson(Map<String, Object?> json) =>
      _$SchoolAnalysisFromJson(json);
}
