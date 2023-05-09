import 'room_ui_model.dart';

class FloorPlanNavArg {
  const FloorPlanNavArg({this.rooms, this.roomEditIndex});

  final List<RoomUiModel>? rooms;
  final int? roomEditIndex;
}