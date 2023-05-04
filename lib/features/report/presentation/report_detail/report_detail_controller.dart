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
    final report = state.requireValue.report;

    final liked = report.liked;
    final likesCount = report.likesCount;
    _setLike(liked: !liked, count: liked ? likesCount - 1 : likesCount + 1);

    final disliked = report.disliked;
    final dislikesCount = report.dislikesCount;
    if (disliked) {
      _setDislike(
        disliked: !disliked,
        count: disliked ? dislikesCount - 1 : dislikesCount + 1,
      );
    }

    final repo = ref.read(reportRepositoryProvider);
    final result = !liked
        ? await repo.addLike(reportId: reportId)
        : await repo.removeDislike(reportId: reportId);

    result.mapLeft((e) {
      _setLike(liked: liked, count: likesCount);
      _setDislike(disliked: disliked, count: dislikesCount);
      setErrorMessage(e.message);
    });
  }

  void _setLike({required bool liked, required int count}) {
    final oldState = state.requireValue;
    final oldReport = oldState.report;

    state = AsyncValue.data(
      oldState.copyWith(
        report: oldReport.copyWith(
          liked: liked,
          likesCount: count,
        ),
      ),
    );
  }

  void toggleDislike() async {
    final report = state.requireValue.report;

    final disliked = report.disliked;
    final dislikesCount = report.dislikesCount;
    _setDislike(
      disliked: !disliked,
      count: disliked ? dislikesCount - 1 : dislikesCount + 1,
    );

    final liked = report.liked;
    final likesCount = report.likesCount;
    if (liked) {
      _setLike(
        liked: !liked,
        count: liked ? likesCount - 1 : likesCount + 1,
      );
    }

    final repo = ref.read(reportRepositoryProvider);
    final result = !disliked
        ? await repo.addDislike(reportId: reportId)
        : await repo.removeDislike(reportId: reportId);

    result.mapLeft((e) {
      _setDislike(disliked: disliked, count: dislikesCount);
      _setLike(liked: liked, count: likesCount);
      setErrorMessage(e.message);
    });
  }

  void _setDislike({required bool disliked, required int count}) async {
    final oldState = state.requireValue;
    final oldReport = oldState.report;

    state = AsyncValue.data(
      oldState.copyWith(
        report: oldReport.copyWith(
          disliked: disliked,
          dislikesCount: count,
        ),
      ),
    );
  }
}
