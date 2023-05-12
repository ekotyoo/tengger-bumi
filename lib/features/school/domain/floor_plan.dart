import 'package:freezed_annotation/freezed_annotation.dart';

import 'room.dart';

part 'floor_plan.freezed.dart';

part 'floor_plan.g.dart';

@freezed
class FloorPlan with _$FloorPlan {
  const factory FloorPlan({
    @Default([]) List<Room> rooms,
  }) = _FloorPlan;

  factory FloorPlan.fromJson(Map<String, Object?> json) =>
      _$FloorPlanFromJson(json);
}
