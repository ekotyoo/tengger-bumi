import 'package:equatable/equatable.dart';

import 'room.dart';

class FloorPlan extends Equatable {
  const FloorPlan({this.rooms = const []});

  final List<Room> rooms;

  FloorPlan copyWith({
    List<Room>? rooms,
  }) {
    return FloorPlan(rooms: rooms ?? this.rooms);
  }

  @override
  List<Object?> get props => [rooms];
}
