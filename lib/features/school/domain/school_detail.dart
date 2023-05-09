import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/models/position.dart';
import '../../report/domain/report.dart';
import 'floor_plan.dart';
import 'school_analysis.dart';

part 'school_detail.freezed.dart';

part 'school_detail.g.dart';

@freezed
class SchoolDetail with _$SchoolDetail {
  const factory SchoolDetail({
    required String id,
    required String name,
    required SchoolAnalysis analysis,
    @JsonKey(name: 'school_location') required Position schoolLocation,
    @JsonKey(name: 'floor_plan') required FloorPlan floorPlan,
    @Default([]) required List<Report> reports,
    String? image,
}) = _SchoolDetail;

  factory SchoolDetail.fromJson(Map<String, Object?> json) => _$SchoolDetailFromJson(json);
}