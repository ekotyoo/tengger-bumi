// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      id: json['id'] as int,
      comment: json['comment'] as String,
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      createdAt: const TimestampSerializer().fromJson(json['created_at']),
      allowEdit: json['allow_edit'] as bool? ?? false,
      deleting: json['deleting'] as bool? ?? false,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'author': instance.author.toJson(),
      'created_at': const TimestampSerializer().toJson(instance.createdAt),
      'allow_edit': instance.allowEdit,
      'deleting': instance.deleting,
    };
