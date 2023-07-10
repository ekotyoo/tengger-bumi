// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SchoolRequest _$$_SchoolRequestFromJson(Map<String, dynamic> json) =>
    _$_SchoolRequest(
      name: json['name'] as String,
      address: json['address'] as String,
      floorPlan: FloorPlan.fromJson(json['floor_plan'] as Map<String, dynamic>),
      centroid: Position.fromJson(json['centroid'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SchoolRequestToJson(_$_SchoolRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'floor_plan': instance.floorPlan.toJson(),
      'centroid': instance.centroid.toJson(),
    };
