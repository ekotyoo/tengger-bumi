import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/auth_user.dart';
import '../../../report/data/report_repository.dart';
import '../../../report/domain/report.dart';
import '../../../report/domain/report_query.dart';
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
    return result.fold(
      (l) => const [],
      (r) => r,
    );
  }

  void logout() async {
    ref.read(authControllerProvider.notifier).logout();
  }
}
