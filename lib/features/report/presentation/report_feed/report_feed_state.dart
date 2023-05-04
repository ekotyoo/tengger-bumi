import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/report.dart';

part 'report_feed_state.freezed.dart';

@freezed
class ReportFeedState with _$ReportFeedState {
  const factory ReportFeedState({
    @Default([]) List<Report> reports,
    String? successMessage,
    String? errorMessage,
  }) = _ReportFeedState;
}
