import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/models/statistic.dart';
import '../../domain/auth_user.dart';
import '../../../report/data/report_repository.dart';
import '../../../report/domain/plant.dart';
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
      final stats = await getUserStats(authState.id);
      return ProfileState(
        user: authState,
        reports: reports,
        stats: stats,
        total: stats.map((e) => e.count).reduce((value, element) => value + element)
      );
    }

    return ProfileState(user: authState);
  }

  Future<List<Plant>> getUserReports(int userId) async {
    final repo = ref.watch(reportRepositoryProvider);
    final result = await repo.getPlants(query: ReportQuery(authorId: userId));
    return result.fold(
      (l) => const [],
      (r) => r,
    );
  }

  Future<List<Statistic>> getUserStats(int userId) async {
    final repo = ref.watch(authRepositoryProvider);
    final result = await repo.getStats(userId: userId);
    return result.fold(
      (l) => const [],
      (r) => r,
    );
  }

  void logout() async {
    ref.read(authControllerProvider.notifier).logout();
  }
}
