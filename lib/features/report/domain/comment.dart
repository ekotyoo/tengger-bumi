import 'package:freezed_annotation/freezed_annotation.dart';

import 'report.dart';
import 'author.dart';

part 'comment.freezed.dart';

part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String comment,
    required Author author,
    @JsonKey(name: 'created_at') @TimestampSerializer() required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, Object> json) => _$CommentFromJson(json);
}
