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
class Report with _$Report {
  const factory Report({
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
    @JsonKey(name: 'comments_count', defaultValue: 0) required int commentsCount,
    @Default([]) List<String> images,
    @JsonKey(name: 'is_active', defaultValue: true) required bool isActive,
  }) = _Report;

  factory Report.fromJson(Map<String, Object?> json) => _$ReportFromJson(json);
}
