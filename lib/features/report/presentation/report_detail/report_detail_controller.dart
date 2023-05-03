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

    final result = await ref.read(reportRepositoryProvider).addComment(
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

  void toggleLike() async {
    final liked = state.requireValue.report.liked;
    _toggleLike(!liked);

    if (state.requireValue.report.disliked) _toggleDislike(false);

    final repo = ref.read(reportRepositoryProvider);
    final result = !liked
        ? await repo.addLike(reportId: reportId)
        : await repo.removeDislike(reportId: reportId);

    result.mapLeft((e) {
      setErrorMessage(e.message);
      _toggleLike(liked);
      _toggleDislike(true);
    });
  }

  void _toggleLike(bool liked) {
    final oldState = state.requireValue;
    final oldReport = oldState.report;

    state = AsyncValue.data(
      oldState.copyWith(
        report: oldReport.copyWith(liked: liked),
      ),
    );
  }

  void toggleDislike() async {
    final disliked = state.requireValue.report.disliked;
    _toggleDislike(!disliked);

    if (state.requireValue.report.liked) _toggleLike(false);

    final repo = ref.read(reportRepositoryProvider);
    final result = !disliked
        ? await repo.addDislike(reportId: reportId)
        : await repo.removeDislike(reportId: reportId);

    result.mapLeft((e) {
      setErrorMessage(e.message);
      _toggleDislike(disliked);
      _toggleLike(true);
    });
  }

  void _toggleDislike(bool disliked) async {
    final oldState = state.requireValue;
    final oldReport = oldState.report;

    state = AsyncValue.data(
      oldState.copyWith(
        report: oldReport.copyWith(disliked: disliked),
      ),
    );
  }
}
