import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/models/position.dart';
import 'category.dart';
import 'additional_info.dart';
import 'report.dart';
import 'author.dart';
import 'comment.dart';

part 'report_detail.freezed.dart';
part 'report_detail.g.dart';

@freezed
class ReportDetail with _$ReportDetail {
  const factory ReportDetail({
    required String id,
    required Category category,
    required String description,
    required Author author,
    required String school,
    required String room,
    required Position position,
    bool? liked,
    @JsonKey(name: 'created_at') @TimestampSerializer() required DateTime createdAt,
    @JsonKey(name: 'likes_count', defaultValue: 0) required int likesCount,
    @JsonKey(name: 'dislikes_count', defaultValue: 0) required  int dislikesCount,
    @Default([]) List<String> images,
    @JsonKey(name: 'is_active', defaultValue: true) required bool isActive,
    @JsonKey(name: 'additional_infos') List<AdditionalInfo>? additionalInfos,
    @Default([]) List<Comment> comments,
  }) = _ReportDetail;

  factory ReportDetail.fromJson(Map<String, Object?> json) => _$ReportDetailFromJson(json);
}