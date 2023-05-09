import 'package:equatable/equatable.dart';

import '../../domain/floor_plan.dart';
import 'room_ui_model.dart';

class FloorPlanUiModel extends Equatable {
  const FloorPlanUiModel({this.rooms = const []});

  final List<RoomUiModel> rooms;

  FloorPlanUiModel copyWith({
    List<RoomUiModel>? rooms,
  }) {
    return FloorPlanUiModel(rooms: rooms ?? this.rooms);
  }

  factory FloorPlanUiModel.fromDomain(FloorPlan floorPlan) => FloorPlanUiModel(
      rooms: floorPlan.rooms.map((e) => RoomUiModel.fromDomain(e)).toList());

  @override
  List<Object?> get props => [rooms];
}
