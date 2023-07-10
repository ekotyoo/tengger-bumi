// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportDetail _$$_ReportDetailFromJson(Map<String, dynamic> json) =>
    _$_ReportDetail(
      id: json['id'] as int,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      description: json['description'] as String,
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      school: json['school'] as String,
      room: json['room'] as String,
      roomId: json['room_id'] as int,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      liked: json['liked'] as bool?,
      createdAt: const TimestampSerializer().fromJson(json['created_at']),
      likesCount: json['likes_count'] as int? ?? 0,
      dislikesCount: json['dislikes_count'] as int? ?? 0,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isActive: json['is_active'] as bool? ?? true,
      additionalInfos: (json['additional_infos'] as List<dynamic>?)
          ?.map((e) => AdditionalInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      allowEdit: json['allow_edit'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ReportDetailToJson(_$_ReportDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category.toJson(),
      'description': instance.description,
      'author': instance.author.toJson(),
      'school': instance.school,
      'room': instance.room,
      'room_id': instance.roomId,
      'position': instance.position.toJson(),
      'liked': instance.liked,
      'created_at': const TimestampSerializer().toJson(instance.createdAt),
      'likes_count': instance.likesCount,
      'dislikes_count': instance.dislikesCount,
      'images': instance.images,
      'is_active': instance.isActive,
      'additional_infos':
          instance.additionalInfos?.map((e) => e.toJson()).toList(),
      'comments': instance.comments.map((e) => e.toJson()).toList(),
      'allow_edit': instance.allowEdit,
    };
