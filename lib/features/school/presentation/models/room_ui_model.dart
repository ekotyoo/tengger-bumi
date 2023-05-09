import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../domain/room.dart';

class RoomUiModel extends Equatable {
  const RoomUiModel({
    required this.label,
    required this.polygon,
    this.color = Colors.yellow,
  });

  final String label;
  final Polygon polygon;
  final Color color;

  factory RoomUiModel.fromDomain(Room room) => RoomUiModel(
        label: room.label,
        polygon: Polygon(
          points:
              room.polygon.map((e) => LatLng(e.latitude, e.longitude)).toList(),
        ),
      );

  @override
  List<Object?> get props => [label, polygon, color];
}
