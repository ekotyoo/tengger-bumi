import 'package:freezed_annotation/freezed_annotation.dart';

import 'additional_info.dart';

part 'report_request.freezed.dart';

part 'report_request.g.dart';

@freezed
class ReportRequest with _$ReportRequest {
  const factory ReportRequest({
    @JsonKey(name: 'school_id') required int schoolId,
    @JsonKey(name: 'room_id') required int roomId,
    @JsonKey(name: 'category_id') required int categoryId,
    required String description,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'additional_infos') List<AdditionalInfo>? additionalInfos,
    @JsonKey(name: 'deleted_images') List<String>? deletedImages,
  }) = _ReportRequest;

  factory ReportRequest.fromJson(Map<String, Object?> json) => _$ReportRequestFromJson(json);
}