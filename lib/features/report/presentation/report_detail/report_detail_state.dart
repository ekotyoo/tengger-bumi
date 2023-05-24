import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/report_detail.dart';

part 'report_detail_state.freezed.dart';

@freezed
class ReportDetailState with _$ReportDetailState {
  const factory ReportDetailState({
    ReportDetail? report,
    @Default(false) bool commentLoading,
    @Default(false) bool reportDeleting,
    String? successMessage,
    String? errorMessage,
  }) = _ReportDetailState;
}
