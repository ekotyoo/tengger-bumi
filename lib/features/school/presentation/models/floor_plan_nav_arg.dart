import 'room.dart';

class FloorPlanNavArg {
  const FloorPlanNavArg({this.rooms, this.roomEditIndex});

  final List<Room>? rooms;
  final int? roomEditIndex;
}