// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportDetail _$$_ReportDetailFromJson(Map<String, dynamic> json) =>
    _$_ReportDetail(
      id: json['id'] as int,
      name: json['name'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      description: json['description'] as String,
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      address: json['address'] as String,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      liked: json['liked'] as bool?,
      createdAt: const TimestampSerializer().fromJson(json['created_at']),
      likesCount: json['likes_count'] as int? ?? 0,
      dislikesCount: json['dislikes_count'] as int? ?? 0,
      plantingCount: json['planting_count'] as int? ?? 0,
      plantingDate: const TimestampSerializer().fromJson(json['planting_date']),
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      allowEdit: json['allow_edit'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ReportDetailToJson(_$_ReportDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category.toJson(),
      'description': instance.description,
      'author': instance.author.toJson(),
      'address': instance.address,
      'position': instance.position.toJson(),
      'liked': instance.liked,
      'created_at': const TimestampSerializer().toJson(instance.createdAt),
      'likes_count': instance.likesCount,
      'dislikes_count': instance.dislikesCount,
      'planting_count': instance.plantingCount,
      'planting_date':
          const TimestampSerializer().toJson(instance.plantingDate),
      'images': instance.images,
      'comments': instance.comments.map((e) => e.toJson()).toList(),
      'allow_edit': instance.allowEdit,
    };
