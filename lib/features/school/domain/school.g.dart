// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_School _$$_SchoolFromJson(Map<String, dynamic> json) => _$_School(
      id: json['id'] as int,
      name: json['name'] as String,
      analysis:
          SchoolAnalysis.fromJson(json['analysis'] as Map<String, dynamic>),
      centroid: Position.fromJson(json['centroid'] as Map<String, dynamic>),
      cover: json['cover'] as String?,
      allowEdit: json['allow_edit'] as bool? ?? false,
    );

Map<String, dynamic> _$$_SchoolToJson(_$_School instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'analysis': instance.analysis.toJson(),
      'centroid': instance.centroid.toJson(),
      'cover': instance.cover,
      'allow_edit': instance.allowEdit,
    };
