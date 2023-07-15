import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_watch_semeru/features/report/domain/report_detail.dart';

import '../../domain/comment.dart';
import '../../data/report_repository.dart';
import 'report_detail_state.dart';

part 'report_detail_controller.g.dart';

@riverpod
class ReportDetailController extends _$ReportDetailController {
  @override
  FutureOr<ReportDetailState> build(int reportId) async {
    final repo = ref.read(reportRepositoryProvider);
    final commentResult = await repo.getComments(plantId: reportId);
    final comments = commentResult.fold(
      (l) => <Comment>[],
      (r) => r,
    );

    final result = await repo.getPlant(plantId: reportId);

    return result.fold(
      (l) => const ReportDetailState(),
      (r) => ReportDetailState(report: r.copyWith(comments: comments)),
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

  void addComment(String comment) async {
    final oldState = state.requireValue;
    state = AsyncValue.data(oldState.copyWith(commentLoading: true));

    final result = await ref.read(reportRepositoryProvider).addComment(
          plantId: reportId,
          comment: comment,
        );

    result.fold(
      (l) {
        setErrorMessage(l.message);
        state = AsyncValue.data(oldState.copyWith(commentLoading: false));
      },
      (newComment) {
        final oldReport = oldState.report;
        if (oldReport == null) return;

        final newComments = [newComment, ...oldReport.comments];
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

  void deleteComment(int commentId, int index) async {
    final oldState = state.requireValue;
    final oldComments = oldState.report?.comments;
    final oldReport = oldState.report;
    if (oldComments == null) return;
    final commentToDelete = oldComments[index].copyWith(deleting: true);

    final newComments = oldComments.toList();
    newComments[index] = commentToDelete;
    final newReport = oldReport?.copyWith(comments: newComments);
    if (newReport == null) return;
    state = AsyncValue.data(oldState.copyWith(report: newReport));

    final repo = ref.read(reportRepositoryProvider);
    final result =
        await repo.deleteComment(plantId: reportId, commentId: commentId);

    result.fold(
      (l) {
        state = AsyncValue.data(oldState);
        setErrorMessage(l.message);
      },
      (r) {
        newComments.removeAt(index);
        final newReport = oldReport?.copyWith(comments: newComments);
        state = AsyncValue.data(oldState.copyWith(report: newReport));
        setSuccessMessage('Komentar berhasil dihapus');
      },
    );
  }

  void deleteReport(PlantDetail report) async {
    final reportRepo = ref.read(reportRepositoryProvider);

    final oldState = state.requireValue;
    state = AsyncValue.data(oldState.copyWith(reportDeleting: true));

    final result = await reportRepo.deleteReport(plantId: report.id);
    result.fold(
      (l) => setErrorMessage(l.message),
      (r) => setSuccessMessage('Laporan berhasil dihapus'),
    );

    state = AsyncValue.data(oldState.copyWith(reportDeleting: false));
  }

  void toggleLike() async {
    final repo = ref.read(reportRepositoryProvider);
    final report = state.requireValue.report;
    if (report == null) return;

    final oldLiked = report.liked;
    final oldLikesCount = report.likesCount;
    final oldDislikesCount = report.dislikesCount;

    if (oldLiked == true) {
      // Remove like local
      // Decrement likes count local
      // Delete like on remote
      _setLike(liked: null, likesCount: oldLikesCount - 1);
      final result = await repo.removeLike(plantId: reportId);
      result.fold(
        (l) {
          // Revert changes
          // Show error message
          _setLike(liked: oldLiked, likesCount: oldLikesCount);
          setErrorMessage(l.message);
        },
        (r) => null,
      );
    } else {
      // Add like local
      // Increment likes count local
      // Post like on remote
      _setLike(
        liked: true,
        likesCount: oldLikesCount + 1,
        dislikesCount: oldLiked == false ? oldDislikesCount - 1 : null,
      );
      final result = await repo.addLike(plantId: reportId);
      result.fold(
        (l) {
          // Revert changes
          // Show error message
          _setLike(
              liked: oldLiked,
              likesCount: oldLikesCount,
              dislikesCount: oldDislikesCount);
          setErrorMessage(l.message);
        },
        (r) => null,
      );
    }
  }

  void toggleDislike() async {
    final repo = ref.read(reportRepositoryProvider);
    final report = state.requireValue.report;
    if (report == null) return;

    final oldLiked = report.liked;
    final oldDislikesCount = report.dislikesCount;
    final oldLikesCount = report.likesCount;

    if (oldLiked == false) {
      // Remove dislike local
      // Decrement dislikes count local
      // Delete like on remote
      _setLike(liked: null, dislikesCount: oldDislikesCount - 1);
      final result = await repo.removeLike(plantId: reportId);
      result.fold(
        (l) {
          // Revert changes
          // Show error message
          _setLike(liked: oldLiked, dislikesCount: oldDislikesCount);
          setErrorMessage(l.message);
        },
        (r) => null,
      );
    } else {
      // Add dislike local
      // Increment dislikes count local
      // Post like on remote
      _setLike(
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

  void _setLike({bool? liked, int? likesCount, int? dislikesCount}) {
    final oldReport = state.requireValue.report;
    if (oldReport == null) return;

    final newReport = oldReport.copyWith(
        liked: liked,
        likesCount: likesCount ?? oldReport.likesCount,
        dislikesCount: dislikesCount ?? oldReport.dislikesCount);

    final newState = state.requireValue.copyWith(report: newReport);

    state = AsyncValue.data(newState);
  }
}
