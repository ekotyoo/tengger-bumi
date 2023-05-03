import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/report_repository.dart';
import 'report_detail_state.dart';

part 'report_detail_controller.g.dart';

@riverpod
class ReportDetailController extends _$ReportDetailController {
  @override
  FutureOr<ReportDetailState> build(String reportId) async {
    final report = await ref.read(reportRepositoryProvider).getReport(
          reportId: reportId,
        );
    return ReportDetailState(report: report);
  }

  void setSuccessMessage(String? message) {
    final oldState = state.requireValue;
    state = AsyncValue.data(oldState.copyWith(successMessage: message));
  }

  void setErrorMessage(String? message) {
    final oldState = state.requireValue;
    state = AsyncValue.data(oldState.copyWith(errorMessage: message));
  }

  void addComment(String comment) async {
    final oldState = state.requireValue;
    state = AsyncValue.data(oldState.copyWith(commentLoading: true));

    final result = await ref.read(reportRepositoryProvider).postComment(
          reportId: reportId,
          comment: comment,
        );

    result.fold(
      (l) => setErrorMessage(l.message),
      (newComment) {
        final newComments = [newComment, ...oldState.report.comments];
        final oldReport = oldState.report;
        final newReport = oldReport.copyWith(comments: newComments);
        final newState = AsyncValue.data(oldState.copyWith(
          commentLoading: false,
          report: newReport,
        ));

        state = newState;
        setSuccessMessage('Komentar berhasil ditambahkan');
      },
    );
  }
}
