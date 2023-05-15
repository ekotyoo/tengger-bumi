import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_watch_semeru/features/auth/domain/auth_user.dart';
import 'package:school_watch_semeru/features/report/data/report_repository.dart';
import 'package:school_watch_semeru/features/report/domain/report.dart';
import 'package:school_watch_semeru/features/report/domain/report_query.dart';

import '../../data/auth_repository.dart';
import '../../auth_controller.dart';
import 'profile_state.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<ProfileState> build() async {
    final authState = ref.watch(authStateProvider);
    if (authState is SignedIn) {
      final reports = await getUserReports(authState.id);
      return ProfileState(user: authState, reports: reports);
    }

    return ProfileState(user: authState);
  }

  Future<List<Report>> getUserReports(String userId) async {
    final repo = ref.watch(reportRepositoryProvider);
    final result = await repo.getReports(query: ReportQuery(authorId: userId));
    return result;
  }

  void logout() async {
    ref.read(authControllerProvider.notifier).logout();
  }
}
