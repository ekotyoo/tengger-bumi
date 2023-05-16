import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_request.freezed.dart';

part 'report_request.g.dart';

@freezed
class ReportRequest with _$ReportRequest {
  const factory ReportRequest({
    @JsonKey(name: 'school_id') required String schoolId,
    @JsonKey(name: 'room_id') required String roomId,
    @JsonKey(name: 'category_id') required String categoryId,
    required String description,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'is_active') bool? isActive,
  }) = _ReportRequest;

  factory ReportRequest.fromJson(Map<String, Object?> json) => _$ReportRequestFromJson(json);
}
