import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

extension PolygonExtension on Polygon {
  Polygon copyWith({
    String? label,
    List<LatLng>? points,
    Color? color,
    bool? isFilled,
  }) {
    return Polygon(
      label: label ?? this.label,
      points: points ?? this.points,
      color: color ?? this.color,
      isFilled: isFilled ?? this.isFilled,
    );
  }
}