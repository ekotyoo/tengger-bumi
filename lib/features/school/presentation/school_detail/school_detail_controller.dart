import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_watch_semeru/features/school/data/school_repository.dart';

import '../../domain/school_detail.dart';

part 'school_detail_controller.g.dart';

@riverpod
class SchoolDetailController extends _$SchoolDetailController {
  @override
  FutureOr<SchoolDetail?> build(String schoolId) async {
    final repo = ref.watch(schoolRepositoryProvider);
    final result = await repo.getSchool(schoolId: schoolId);

    return result.fold(
      (l) => null,
      (r) => r,
    );
  }
}
