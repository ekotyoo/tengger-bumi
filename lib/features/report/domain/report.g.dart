// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Report _$$_ReportFromJson(Map<String, dynamic> json) => _$_Report(
      id: json['id'] as int,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      description: json['description'] as String,
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      school: json['school'] as String,
      room: json['room'] as String,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      deleting: json['deleting'] as bool? ?? false,
      liked: json['liked'] as bool?,
      createdAt: const TimestampSerializer().fromJson(json['created_at']),
      likesCount: json['likes_count'] as int? ?? 0,
      dislikesCount: json['dislikes_count'] as int? ?? 0,
      commentsCount: json['comments_count'] as int? ?? 0,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isActive: json['is_active'] as bool? ?? true,
      allowEdit: json['allow_edit'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ReportToJson(_$_Report instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category.toJson(),
      'description': instance.description,
      'author': instance.author.toJson(),
      'school': instance.school,
      'room': instance.room,
      'position': instance.position.toJson(),
      'deleting': instance.deleting,
      'liked': instance.liked,
      'created_at': const TimestampSerializer().toJson(instance.createdAt),
      'likes_count': instance.likesCount,
      'dislikes_count': instance.dislikesCount,
      'comments_count': instance.commentsCount,
      'images': instance.images,
      'is_active': instance.isActive,
      'allow_edit': instance.allowEdit,
    };
