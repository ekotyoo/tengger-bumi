import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tetenger_bumi/common/models/position.dart';

import 'floor_plan.dart';

part 'school_request.freezed.dart';

part 'school_request.g.dart';

@freezed
class SchoolRequest with _$SchoolRequest {
  const factory SchoolRequest({
    required String name,
    required String address,
    @JsonKey(name: 'floor_plan') required FloorPlan floorPlan,
    required Position centroid,
  }) = _SchoolRequest;

  factory SchoolRequest.fromJson(Map<String, Object?> json) => _$SchoolRequestFromJson(json);
}
