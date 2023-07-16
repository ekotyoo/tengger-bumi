import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/constants/constant.dart';
import '../../domain/category.dart';
import '../../domain/plant.dart';
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
Future<List<Category>> getCategories(GetCategoriesRef ref) async {
  final repo = ref.watch(reportRepositoryProvider);

  final cancelToken = CancelToken();

  final link = ref.keepAlive();
  Timer? timer;

  ref.onDispose(() {
    cancelToken.cancel();
    timer?.cancel();
  });

  ref.onCancel(() {
    timer = Timer(const Duration(seconds: 30), () {
      link.close();
    });
  });

  await Future.delayed(kDurationLong);
  if (cancelToken.isCancelled) throw Exception();

  final result = await repo.getCategories(cancelToken: cancelToken);
  return result.fold(
        (l) => const [],
        (r) => r,
  );
}


@Riverpod(keepAlive: true)
class ReportFeedController extends _$ReportFeedController {
  @override
  FutureOr<ReportFeedState> build(ReportQuery query) async {
    final reportRepo = ref.read(reportRepositoryProvider);
    final result = await reportRepo.getPlants(query: query);

    return result.fold(
      (l) => ReportFeedState(errorMessage: l.message),
      (r) => ReportFeedState(reports: r),
    );
  }

  void deleteReport(Plant report, int index) async {
    final reportRepo = ref.read(reportRepositoryProvider);

    final oldState = state.requireValue;
    final oldReports = oldState.reports.toList();
    oldReports[index] = report.copyWith(deleting: true);
    state = AsyncValue.data(oldState.copyWith(reports: oldReports));

    final result = await reportRepo.deleteReport(plantId: report.id);
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

  void updateReport(Plant report) {
    final oldState = state.requireValue;
    final reports = oldState.reports.toList();
    final index = reports.indexWhere((element) => element.id == report.id);
    reports[index] = report;
    final newReports = reports.toList();

    state = AsyncValue.data(oldState.copyWith(reports: newReports));
  }

  void addReport(Plant report) {
    if (!state.hasValue) return;
    final oldState = state.requireValue;
    state = AsyncValue.data(oldState.copyWith(reports: [report, ...oldState.reports]));
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
      final result = await repo.removeLike(plantId: reportId);
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
      final result = await repo.addLike(plantId: reportId);
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

  void toggleDislike(int index, int reportId) async {
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
      final result = await repo.removeLike(plantId: reportId);
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
      final result = await repo.addLike(plantId: reportId, isLike: false);
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
