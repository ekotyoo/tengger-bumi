import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/models/position.dart';

part 'room.freezed.dart';

part 'room.g.dart';

@freezed
class Room with _$Room {
  const factory Room({
    required String? id,
    required String label,
    required List<Position> polygon,
    required String color,
  }) = _Room;

  factory Room.fromJson(Map<String, Object> json) =>  _$RoomFromJson(json);
}
