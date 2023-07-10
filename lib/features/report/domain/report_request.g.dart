// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportRequest _$$_ReportRequestFromJson(Map<String, dynamic> json) =>
    _$_ReportRequest(
      schoolId: json['school_id'] as int,
      roomId: json['room_id'] as int,
      categoryId: json['category_id'] as int,
      description: json['description'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      isActive: json['is_active'] as bool?,
      additionalInfos: (json['additional_infos'] as List<dynamic>?)
          ?.map((e) => AdditionalInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      deletedImages: (json['deleted_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ReportRequestToJson(_$_ReportRequest instance) =>
    <String, dynamic>{
      'school_id': instance.schoolId,
      'room_id': instance.roomId,
      'category_id': instance.categoryId,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'is_active': instance.isActive,
      'additional_infos':
          instance.additionalInfos?.map((e) => e.toJson()).toList(),
      'deleted_images': instance.deletedImages,
    };
