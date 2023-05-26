import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_utils/flutter_color_utils.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../common/models/position.dart';
import '../../domain/room.dart';

class RoomUiModel extends Equatable {
  const RoomUiModel({
    this.id,
    required this.label,
    required this.polygon,
    this.color = Colors.yellow,
  });

  final int? id;
  final String label;
  final Polygon polygon;
  final Color color;

  factory RoomUiModel.fromDomain(Room room) => RoomUiModel(
        id: room.id,
        label: room.label,
        polygon: Polygon(
          points: room.polygon
              .map(
                (e) => LatLng(e.latitude, e.longitude),
              )
              .toList(),
        ),
        color: HexColor(room.color),
      );

  Room toDomain() => Room(
        id: id,
        label: label,
        polygon: polygon.points
            .map((e) => Position(
                  latitude: e.latitude,
                  longitude: e.longitude,
                ))
            .toList(),
        color: color.toHex(),
      );

  @override
  List<Object?> get props => [id, label, polygon, color];
}

extension ColorX on Color {
  String toHex({bool leadingHashSign = true}) =>
      ('${leadingHashSign ? '#' : ''}'
              '${red.toRadixString(16).padLeft(2, '0')}'
              '${green.toRadixString(16).padLeft(2, '0')}'
              '${blue.toRadixString(16).padLeft(2, '0')}')
          .toUpperCase();
}
