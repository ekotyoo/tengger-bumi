import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class Room extends Equatable {
  const Room({
    required this.label,
    required this.polygon,
    this.color = Colors.yellow,
  });

  final String label;
  final Polygon polygon;
  final Color color;

  @override
  List<Object?> get props => [label, polygon, color];
}
