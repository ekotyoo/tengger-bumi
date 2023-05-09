import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../common/models/position.dart';

part 'report_request.freezed.dart';

part 'report_request.g.dart';

@freezed
class ReportRequest with _$ReportRequest {
  const factory ReportRequest({
    @JsonKey(name: 'school_id') required String schoolId,
    @JsonKey(name: 'report_type') required String reportType,
    required String description,
    @JsonKey(name: 'category_id') required String categoryId,
    required Position position,
  }) = _ReportRequest;

  factory ReportRequest.fromJson(Map<String, Object?> json) => _$ReportRequestFromJson(json);
}
