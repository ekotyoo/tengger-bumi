import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/models/position.dart';
import 'category.dart';
import 'author.dart';

part 'report.freezed.dart';

part 'report.g.dart';

class TimestampSerializer implements JsonConverter<DateTime, dynamic> {
  const TimestampSerializer();

  @override
  DateTime fromJson(dynamic timestamp) => DateTime.parse(timestamp).toLocal();

  @override
  String toJson(DateTime date) => date.toString();
}

@freezed
class Plant with _$Plant {
  const factory Plant({
    required int id,
    required String name,
    required Category category,
    required String description,
    required Author author,
    required String address,
    required Position position,
    @Default(false) bool deleting,
    bool? liked,
    @JsonKey(name: 'created_at') @TimestampSerializer() required DateTime createdAt,
    @JsonKey(name: 'likes_count', defaultValue: 0) required int likesCount,
    @JsonKey(name: 'dislikes_count', defaultValue: 0) required  int dislikesCount,
    @JsonKey(name: 'comments_count', defaultValue: 0) required int commentsCount,
    @Default([]) List<String> images,
    @JsonKey(name: 'allow_edit', defaultValue: false) required bool allowEdit,
  }) = _Plant;

  factory Plant.fromJson(Map<String, Object?> json) => _$PlantFromJson(json);
}
