import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_position.freezed.dart';

part 'report_position.g.dart';

@freezed
class ReportPosition with _$ReportPosition {
  const factory ReportPosition({
    required double latitude,
    required double longitude,
  }) = _ReportPosition;

  factory ReportPosition.fromJson(Map<String, Object?> json) => _$ReportPositionFromJson(json);
}
