// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlantRequest _$$_PlantRequestFromJson(Map<String, dynamic> json) =>
    _$_PlantRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      deletedImages: (json['deleted_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      villageId: json['village_id'] as int,
      categoryId: json['category_id'] as int,
      plantingDate: json['planting_date'] as int,
      plantingCount: json['planting_count'] as int,
    );

Map<String, dynamic> _$$_PlantRequestToJson(_$_PlantRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'deleted_images': instance.deletedImages,
      'village_id': instance.villageId,
      'category_id': instance.categoryId,
      'planting_date': instance.plantingDate,
      'planting_count': instance.plantingCount,
    };
