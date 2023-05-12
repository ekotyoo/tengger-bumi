import 'package:latlong2/latlong.dart';
import '../../../school/presentation/models/floor_plan_ui_model.dart';

class LocationPickNavArg {
  LocationPickNavArg({this.selectedPosition, required this.floorPlan});

  final LatLng? selectedPosition;
  final FloorPlanUiModel floorPlan;
}
