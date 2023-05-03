import 'package:freezed_annotation/freezed_annotation.dart';

import 'report.dart';
import 'author.dart';
import 'comment.dart';

part 'report_detail.freezed.dart';
part 'report_detail.g.dart';

@freezed
class ReportDetail with _$ReportDetail {
  const factory ReportDetail({
    required String id,
    @JsonKey(name: 'report_type') required String reportType,
    @JsonKey(name: 'report_category') required String reportCategory,
    required String description,
    required Author author,
    required String school,
    required String room,
    @Default(false) bool liked,
    @Default(false) bool disliked,
    @JsonKey(name: 'created_at') @TimestampSerializer() required DateTime createdAt,
    @JsonKey(name: 'likes_count', defaultValue: 0) required int likesCount,
    @JsonKey(name: 'dislikes_count', defaultValue: 0) required  int dislikesCount,
    @JsonKey(name: 'comments_count', defaultValue: 0) required int commentsCount,
    @Default([]) List<String> images,
    @JsonKey(name: 'is_active', defaultValue: true) required bool isActive,
    @JsonKey(name: 'additional_info') Map<String, Object?>? additionalInfo,
    @Default([]) List<Comment> comments,
  }) = _ReportDetail;

  factory ReportDetail.fromJson(Map<String, Object?> json) => _$ReportDetailFromJson(json);
}