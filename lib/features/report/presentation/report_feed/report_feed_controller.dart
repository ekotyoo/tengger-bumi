import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_watch_semeru/features/report/domain/report.dart';

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

  void deleteReport(Report report, int index) async {
    final reportRepo = ref.read(reportRepositoryProvider);

    final oldState = state.requireValue;
    final oldReports = oldState.reports.toList();
    oldReports[index] = report.copyWith(deleting: true);
    state = AsyncValue.data(oldState.copyWith(reports: oldReports));

    final result = await reportRepo.deleteReport(reportId: report.id);
    result.fold(
      (l) {
        setErrorMessage(l.message);
        oldReports[index] = report.copyWith(deleting: false);
        state = AsyncValue.data(oldState.copyWith(reports: oldReports));
      },
      (r) {
        setSuccessMessage('Laporan berhasil dihapus');
        _deleteReport(index);
      },
    );
  }

  void _deleteReport(int index) {
    final oldState = state.requireValue;
    final oldReports = oldState.reports.toList();
    oldReports.removeAt(index);
    state = AsyncValue.data(oldState.copyWith(reports: oldReports));
  }

  void addReport(Report report) {
    final oldState = state.requireValue;
    state = AsyncValue.data(
        oldState.copyWith(reports: [report, ...oldState.reports]));
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
    final repo = ref.read(reportRepositoryProvider);
    final report = state.requireValue.reports[index];

    final oldLiked = report.liked;
    final oldLikesCount = report.likesCount;
    final oldDislikesCount = report.dislikesCount;

    if (oldLiked == true) {
      // Remove like local
      // Decrement likes count local
      // Delete like on remote
      _setLike(index, liked: null, likesCount: oldLikesCount - 1);
      final result = await repo.removeLike(reportId: reportId);
      result.fold(
        (l) {
          // Revert changes
          // Show error message
          _setLike(index, liked: oldLiked, likesCount: oldLikesCount);
          setErrorMessage(l.message);
        },
        (r) => null,
      );
    } else {
      // Add like local
      // Increment likes count local
      // Post like on remote
      _setLike(
        index,
        liked: true,
        likesCount: oldLikesCount + 1,
        dislikesCount: oldLiked == false ? oldDislikesCount - 1 : null,
      );
      final result = await repo.addLike(reportId: reportId);
      result.fold(
        (l) {
          // Revert changes
          // Show error message
          _setLike(index,
              liked: oldLiked,
              likesCount: oldLikesCount,
              dislikesCount: oldDislikesCount);
          setErrorMessage(l.message);
        },
        (r) => null,
      );
    }
  }

  void toggleDislike(int index, String reportId) async {
    final repo = ref.read(reportRepositoryProvider);
    final report = state.requireValue.reports[index];

    final oldLiked = report.liked;
    final oldDislikesCount = report.dislikesCount;
    final oldLikesCount = report.likesCount;

    if (oldLiked == false) {
      // Remove dislike local
      // Decrement dislikes count local
      // Delete like on remote
      _setLike(index, liked: null, dislikesCount: oldDislikesCount - 1);
      final result = await repo.removeLike(reportId: reportId);
      result.fold(
        (l) {
          // Revert changes
          // Show error message
          _setLike(index, liked: oldLiked, dislikesCount: oldDislikesCount);
          setErrorMessage(l.message);
        },
        (r) => null,
      );
    } else {
      // Add dislike local
      // Increment dislikes count local
      // Post like on remote
      _setLike(
        index,
        liked: false,
        likesCount: oldLiked == true ? oldLikesCount - 1 : null,
        dislikesCount: oldDislikesCount + 1,
      );
      final result = await repo.addLike(reportId: reportId, isLike: false);
      result.fold(
        (l) {
          // Revert changes
          // Show error message
          _setLike(
            index,
            liked: oldLiked,
            likesCount: oldDislikesCount,
            dislikesCount: oldDislikesCount,
          );
          setErrorMessage(l.message);
        },
        (r) => null,
      );
    }
  }

  void _setLike(int index, {bool? liked, int? likesCount, int? dislikesCount}) {
    final reports = state.requireValue.reports.toList();
    final oldReport = reports[index];

    final newReport = oldReport.copyWith(
        liked: liked,
        likesCount: likesCount ?? oldReport.likesCount,
        dislikesCount: dislikesCount ?? oldReport.dislikesCount);

    reports[index] = newReport;

    final newState = state.requireValue.copyWith(reports: reports);

    state = AsyncValue.data(newState);
  }
}
