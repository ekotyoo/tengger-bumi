import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/report_repository.dart';
import '../../domain/report_query.dart';
import 'report_feed_state.dart';

part 'report_feed_controller.g.dart';

@riverpod
class ReportFilterState extends _$ReportFilterState {
  @override
  ReportQuery build() {
    return const ReportQuery();
  }

  void updateFilterState(ReportQuery state) => this.state = state;
}

@riverpod
class ReportFeedController extends _$ReportFeedController {
  @override
  FutureOr<ReportFeedState> build(ReportQuery query) async {
    final reportRepo = ref.read(reportRepositoryProvider);
    final result = await reportRepo.getReports(query: query);

    return result.fold(
      (l) => ReportFeedState(errorMessage: l.message),
      (r) => ReportFeedState(reports: r),
    );
  }

  void setSuccessMessage(String? message) {
    final oldState = state.requireValue;
    state = AsyncValue.data(oldState.copyWith(successMessage: message));
  }

  void setErrorMessage(String? message) {
    final oldState = state.requireValue;
    state = AsyncValue.data(oldState.copyWith(errorMessage: message));
  }

  void toggleLike(int index, reportId) async {
    final report = state.requireValue.reports[index];

    final liked = report.liked;
    final likesCount = report.likesCount;
    _setLike(
      index,
      count: liked ? likesCount - 1 : likesCount + 1,
      liked: !liked,
    );

    final disliked = report.disliked;
    final dislikesCount = report.dislikesCount;
    if (disliked) {
      _setDislike(
        index,
        disliked: !disliked,
        count: disliked ? dislikesCount - 1 : dislikesCount + 1,
      );
    }

    final repo = ref.watch(reportRepositoryProvider);
    final result = !liked
        ? await repo.addLike(reportId: reportId)
        : await repo.removeLike(reportId: reportId);

    result.mapLeft((e) {
      _setLike(index, liked: liked, count: likesCount);
      _setDislike(index, disliked: disliked, count: dislikesCount);
      setErrorMessage(e.message);
    });
  }

  void _setLike(int index, {required bool liked, required int count}) {
    final reports = state.requireValue.reports.toList();
    final oldReport = reports[index];

    final newReport = oldReport.copyWith(
      liked: liked,
      likesCount: liked ? oldReport.likesCount + 1 : oldReport.likesCount - 1,
    );

    reports[index] = newReport;

    final newState = state.requireValue.copyWith(reports: reports);

    state = AsyncValue.data(newState);
  }

  void toggleDislike(int index, String reportId) async {
    final report = state.requireValue.reports[index];

    final disliked = report.disliked;
    final dislikesCount = report.dislikesCount;
    _setDislike(
      index,
      count: disliked ? dislikesCount - 1 : dislikesCount + 1,
      disliked: !disliked,
    );

    final liked = report.liked;
    final likesCount = report.likesCount;
    if (liked) {
      _setLike(
        index,
        liked: !liked,
        count: liked ? likesCount - 1 : likesCount + 1,
      );
    }

    final repo = ref.watch(reportRepositoryProvider);
    final result = !disliked
        ? await repo.addDislike(reportId: reportId)
        : await repo.removeDislike(reportId: reportId);

    result.mapLeft((e) {
      _setLike(index, liked: liked, count: likesCount);
      _setDislike(index, disliked: disliked, count: dislikesCount);
      setErrorMessage(e.message);
    });
  }

  void _setDislike(int index, {required int count, required bool disliked}) {
    final reports = state.requireValue.reports.toList();
    final oldReport = reports[index];

    final newReport = oldReport.copyWith(
      disliked: disliked,
      dislikesCount: count,
    );

    reports[index] = newReport;

    final newState = state.requireValue.copyWith(reports: reports);

    state = AsyncValue.data(newState);
  }
}
