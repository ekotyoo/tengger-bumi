// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FloorPlan _$$_FloorPlanFromJson(Map<String, dynamic> json) => _$_FloorPlan(
      rooms: (json['rooms'] as List<dynamic>?)
              ?.map((e) => Room.fromJson((e as Map<String, dynamic>).map(
                    (k, e) => MapEntry(k, e as Object),
                  )))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FloorPlanToJson(_$_FloorPlan instance) =>
    <String, dynamic>{
      'rooms': instance.rooms.map((e) => e.toJson()).toList(),
    };
