import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tetenger_bumi/features/report/domain/category.dart';
import '../../../common/models/regency.dart';
import 'report_time.dart';

part 'report_query.freezed.dart';

@freezed
class ReportQuery with _$ReportQuery {
  const factory ReportQuery({
    @Default(1) int page,
    @Default(200) int take,
    Category? category,
    Regency? regency,
    ReportTime? reportTime,
    int? authorId,
  }) = _ReportQuery;
}