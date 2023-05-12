import 'package:freezed_annotation/freezed_annotation.dart';

import 'floor_plan.dart';

part 'school_request.freezed.dart';

part 'school_request.g.dart';

@freezed
class SchoolRequest with _$SchoolRequest {
  const factory SchoolRequest({
    required String schoolName,
    required String schoolAddress,
    required FloorPlan floorPlan,
  }) = _SchoolRequest;

  factory SchoolRequest.fromJson(Map<String, Object?> json) => _$SchoolRequestFromJson(json);
}
