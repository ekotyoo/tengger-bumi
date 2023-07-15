import 'floor_plan_ui_model.dart';
import '../../../report/domain/report.dart';

class SchoolDetailFloorPlanNavArg {
  const SchoolDetailFloorPlanNavArg({required this.floorPlan, required this.reports});

  final FloorPlanUiModel floorPlan;
  final List<Plant> reports;
}