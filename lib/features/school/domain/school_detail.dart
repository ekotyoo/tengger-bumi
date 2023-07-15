import 'package:freezed_annotation/freezed_annotation.dart';

import '../../report/domain/plant.dart';
import 'floor_plan.dart';
import 'school_analysis.dart';

part 'school_detail.freezed.dart';

part 'school_detail.g.dart';

@freezed
class SchoolDetail with _$SchoolDetail {
  const factory SchoolDetail({
    required int id,
    required String name,
    required String address,
    required SchoolAnalysis analysis,
    @JsonKey(name: 'floor_plan') required FloorPlan floorPlan,
    @Default([]) List<Plant> reports,
    String? image,
}) = _SchoolDetail;

  factory SchoolDetail.fromJson(Map<String, Object?> json) => _$SchoolDetailFromJson(json);
}