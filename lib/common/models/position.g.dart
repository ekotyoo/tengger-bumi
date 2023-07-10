// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Position _$$_PositionFromJson(Map<String, dynamic> json) => _$_Position(
      latitude: const DoubleSerializer().fromJson(json['latitude']),
      longitude: const DoubleSerializer().fromJson(json['longitude']),
    );

Map<String, dynamic> _$$_PositionToJson(_$_Position instance) =>
    <String, dynamic>{
      'latitude': const DoubleSerializer().toJson(instance.latitude),
      'longitude': const DoubleSerializer().toJson(instance.longitude),
    };
