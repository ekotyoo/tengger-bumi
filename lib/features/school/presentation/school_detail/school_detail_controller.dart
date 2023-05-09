import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/models/position.dart';
import '../../domain/floor_plan.dart';
import '../../../../common/constants/constant.dart';
import '../../domain/school_analysis.dart';

import '../../domain/school_detail.dart';

part 'school_detail_controller.g.dart';

@riverpod
class SchoolDetailController extends _$SchoolDetailController {
  @override
  FutureOr<SchoolDetail> build(String schoolId) async {
    await Future.delayed(kDurationLong);

    return const SchoolDetail(
      id: '',
      name: '',
      schoolLocation: Position(latitude: .0, longitude: .0),
      reports: [],
      floorPlan: FloorPlan(rooms: []),
      analysis: SchoolAnalysis(
        recoveryLevel: '',
        emergencyResponseLevel: '',
        preventionLevel: '',
      ),
    );
  }
}