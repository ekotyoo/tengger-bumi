import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/models/position.dart';
import 'category.dart';
import 'plant.dart';
import 'author.dart';
import 'comment.dart';

part 'report_detail.freezed.dart';
part 'report_detail.g.dart';

@freezed
class PlantDetail with _$PlantDetail {
  const factory PlantDetail({
    required int id,
    required String name,
    required Category category,
    required String description,
    required Author author,
    required String address,
    required Position position,
    bool? liked,
    @JsonKey(name: 'created_at') @TimestampSerializer() required DateTime createdAt,
    @JsonKey(name: 'likes_count', defaultValue: 0) required int likesCount,
    @JsonKey(name: 'dislikes_count', defaultValue: 0) required  int dislikesCount,
    @JsonKey(name: 'planting_count', defaultValue: 0) required  int plantingCount,
    @JsonKey(name: 'planting_date') @TimestampSerializer() required DateTime plantingDate,
    @Default([]) List<String> images,
    @Default([]) List<Comment> comments,
    @JsonKey(name: 'allow_edit', defaultValue: false) required bool allowEdit,
  }) = _ReportDetail;

  factory PlantDetail.fromJson(Map<String, Object?> json) => _$PlantDetailFromJson(json);
}