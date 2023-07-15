import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../report/data/report_repository.dart';
import '../../../report/domain/report_query.dart';
import '../../data/school_repository.dart';
import '../../../report/domain/report.dart';
import '../../domain/school_detail.dart';

part 'school_detail_controller.g.dart';

@riverpod
class SchoolDetailController extends _$SchoolDetailController {
  @override
  FutureOr<SchoolDetail?> build(int schoolId) async {
    final schoolRepo = ref.watch(schoolRepositoryProvider);
    final reportRepo = ref.watch(reportRepositoryProvider);

    final schoolResult = await schoolRepo.getSchool(schoolId: schoolId);
    final reportsResult =
        await reportRepo.getPlants(query: ReportQuery(schoolId: schoolId));

    final reports = reportsResult.fold(
      (l) => const <Plant>[],
      (r) => r,
    );

    return schoolResult.fold(
      (l) => null,
      (r) {
        final school = r.copyWith(reports: reports);
        return school;
      },
    );
  }
}
