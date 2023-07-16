// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Plant _$$_PlantFromJson(Map<String, dynamic> json) => _$_Plant(
      id: json['id'] as int,
      name: json['name'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      description: json['description'] as String,
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      address: json['address'] as String,
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
      allowEdit: json['allow_edit'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PlantToJson(_$_Plant instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category.toJson(),
      'description': instance.description,
      'author': instance.author.toJson(),
      'address': instance.address,
      'position': instance.position.toJson(),
      'deleting': instance.deleting,
      'liked': instance.liked,
      'created_at': const TimestampSerializer().toJson(instance.createdAt),
      'likes_count': instance.likesCount,
      'dislikes_count': instance.dislikesCount,
      'comments_count': instance.commentsCount,
      'images': instance.images,
      'allow_edit': instance.allowEdit,
    };
