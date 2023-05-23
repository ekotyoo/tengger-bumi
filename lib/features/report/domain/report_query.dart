import 'package:freezed_annotation/freezed_annotation.dart';
import 'report_status.dart';
import 'report_time.dart';
import 'report_type.dart';

part 'report_query.freezed.dart';

@freezed
class ReportQuery with _$ReportQuery {
  const factory ReportQuery({
    @Default(1) int page,
    @Default(20) int take,
    ReportType? reportType,
    ReportStatus? reportStatus,
    @Default(ReportTime.all) ReportTime reportTime,
    String? reportCategory,
    int? authorId,
    int? schoolId,
    @Default(true) bool isActive,
  }) = _ReportQuery;
}