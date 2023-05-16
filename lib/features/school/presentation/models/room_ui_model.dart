import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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

  final String? id;
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
        color: color.toString(),
      );

  @override
  List<Object?> get props => [id, label, polygon, color];
}
