import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../models/floor_plan_ui_model.dart';
import '../../../../common/constants/constant.dart';

class SchoolFloorPlanScreen extends StatefulWidget {
  const SchoolFloorPlanScreen({Key? key, required this.floorPlan}) : super(key: key);

  final FloorPlanUiModel floorPlan;

  @override
  State<SchoolFloorPlanScreen> createState() => _SchoolFloorPlanScreenState();
}

class _SchoolFloorPlanScreenState extends State<SchoolFloorPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(SWStrings.labelSchoolFloorPlan),
          centerTitle: true,
        ),
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(-7.956197, 112.627658),
            zoom: 10,
            minZoom: 1,
            absorbPanEventsOnScrollables: false,
            onTap: (_, point) {},
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
              userAgentPackageName: 'com.ekotyoo.school_watch_semeru',
              maxNativeZoom: 19,
              maxZoom: 35,
            ),
          ],
        ),
      ),
    );
  }
}
