// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SchoolDetail _$$_SchoolDetailFromJson(Map<String, dynamic> json) =>
    _$_SchoolDetail(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      analysis:
          SchoolAnalysis.fromJson(json['analysis'] as Map<String, dynamic>),
      floorPlan: FloorPlan.fromJson(json['floor_plan'] as Map<String, dynamic>),
      reports: (json['reports'] as List<dynamic>?)
              ?.map((e) => Plant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_SchoolDetailToJson(_$_SchoolDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'analysis': instance.analysis.toJson(),
      'floor_plan': instance.floorPlan.toJson(),
      'reports': instance.reports.map((e) => e.toJson()).toList(),
      'image': instance.image,
    };
