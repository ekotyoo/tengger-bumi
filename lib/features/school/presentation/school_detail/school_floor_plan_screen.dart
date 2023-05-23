import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:polylabel/polylabel.dart';

import '../../../../common/widgets/open_street_map_attribution.dart';
import '../../../../common/widgets/sw_button.dart';
import '../../../../common/constants/constant.dart';
import '../../../../common/routing/routes.dart';
import '../../../report/presentation/widgets/report_card.dart';
import '../models/school_detail_floor_plan_nav_arg.dart';

class SchoolFloorPlanScreen extends StatefulWidget {
  const SchoolFloorPlanScreen({Key? key, required this.arg}) : super(key: key);

  final SchoolDetailFloorPlanNavArg arg;

  @override
  State<SchoolFloorPlanScreen> createState() => _SchoolFloorPlanScreenState();
}

class _SchoolFloorPlanScreenState extends State<SchoolFloorPlanScreen> {
  late MapController _mapController;
  late FollowOnLocationUpdate _followOnLocationUpdate;
  late StreamController<double?> _followCurrentLocationStreamController;
  late LatLng _schoolCentroid;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _followOnLocationUpdate = FollowOnLocationUpdate.never;
    _followCurrentLocationStreamController = StreamController();
    _initSchoolCentroid();
  }

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
    _followCurrentLocationStreamController.close();
  }

  void _initSchoolCentroid() {
    final points = widget.arg.floorPlan.rooms
        .map((e) => e.polygon.points
            .map((p) => Point(p.latitude, p.longitude))
            .toList())
        .toList();

    final result = polylabel(points).point;
    _schoolCentroid = LatLng(result.x.toDouble(), result.y.toDouble());
  }

  _buildMapControl() {
    return [
      Align(
        alignment: Alignment.topRight,
        child: IconButton(
          iconSize: SWSizes.s32 + SWSizes.s8,
          onPressed: () => _mapController.rotate(0),
          icon: const CircleAvatar(
            child: Icon(Icons.navigation_rounded),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              iconSize: SWSizes.s32 + SWSizes.s8,
              onPressed: () {
                setState(() =>
                    _followOnLocationUpdate = FollowOnLocationUpdate.never);
                final currentZoom = _mapController.zoom;
                _mapController.move(
                  _mapController.center,
                  currentZoom + 1,
                );
              },
              icon: const CircleAvatar(
                child: Icon(Icons.add),
              ),
            ),
            IconButton(
              iconSize: SWSizes.s32 + SWSizes.s8,
              onPressed: () {
                setState(() =>
                    _followOnLocationUpdate = FollowOnLocationUpdate.never);
                final currentZoom = _mapController.zoom;
                _mapController.move(
                  _mapController.center,
                  currentZoom - 1,
                );
              },
              icon: const CircleAvatar(
                child: Icon(Icons.remove),
              ),
            ),
            IconButton(
              iconSize: SWSizes.s32 + SWSizes.s8,
              onPressed: () => setState(() => _followOnLocationUpdate = FollowOnLocationUpdate.always),
              icon: const CircleAvatar(
                child: Icon(Icons.my_location),
              ),
            ),
            IconButton(
              iconSize: SWSizes.s32 + SWSizes.s8,
              onPressed: () {
                setState(() =>
                    _followOnLocationUpdate = FollowOnLocationUpdate.never);
                _mapController.move(_schoolCentroid, 21);
              },
              icon: const CircleAvatar(
                child: Icon(Icons.home_work_outlined),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(SWStrings.labelSchoolFloorPlan),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center: _schoolCentroid,
                zoom: 18,
                minZoom: 1,
                absorbPanEventsOnScrollables: false,
                onTap: (_, point) {},
                onPositionChanged: (MapPosition position, bool hasGesture) {
                  if (hasGesture &&
                      _followOnLocationUpdate != FollowOnLocationUpdate.never) {
                    setState(
                      () => _followOnLocationUpdate =
                          FollowOnLocationUpdate.never,
                    );
                  }
                },
              ),
              nonRotatedChildren: const [OpenStreetMapAttribution()],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.ekotyoo.school_watch_semeru',
                  maxNativeZoom: 19,
                  maxZoom: 35,
                ),
                PolygonLayer(
                  polygons: widget.arg.floorPlan.rooms
                      .map(
                        (e) => Polygon(
                          points: e.polygon.points,
                          label: e.label,
                          color: e.color.withOpacity(.5),
                          isFilled: true,
                          borderStrokeWidth: 1,
                          borderColor: kColorNeutral900,
                          labelStyle: const TextStyle(color: kColorNeutral900),
                        ),
                      )
                      .toList(),
                ),
                CurrentLocationLayer(
                  followOnLocationUpdate: _followOnLocationUpdate,
                  followCurrentLocationStream:
                      _followCurrentLocationStreamController.stream,
                  style: LocationMarkerStyle(
                    marker: const DefaultLocationMarker(
                      color: kColorSuccess500,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: SWSizes.s16 + SWSizes.s2,
                      ),
                    ),
                    markerSize: const Size.square(SWSizes.s32),
                    accuracyCircleColor: kColorSuccess500.withOpacity(0.1),
                    headingSectorColor: kColorSuccess500.withOpacity(0.5),
                    headingSectorRadius: 60,
                  ),
                ),
                MarkerLayer(
                  markers: widget.arg.reports
                      .map(
                        (report) => Marker(
                          width: SWSizes.s40,
                          height: SWSizes.s40,
                          point: LatLng(report.position.latitude,
                              report.position.longitude),
                          rotate: true,
                          builder: (context) => GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(SWSizes.s32),
                                    topRight: Radius.circular(SWSizes.s32),
                                  ),
                                ),
                                builder: (context) => Padding(
                                  padding: const EdgeInsets.all(SWSizes.s16),
                                  child: Wrap(
                                    runSpacing: SWSizes.s16,
                                    children: [
                                      ReportCard(
                                          report: report,
                                          showInteractionBar: false),
                                      SWButton(
                                        label: SWStrings.labelSeeMore,
                                        onPressed: () => context.pushNamed(
                                            Routes.reportDetail,
                                            params: {'reportId': report.id.toString()}),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: const CircleAvatar(
                              backgroundColor: kColorPrimary100,
                              child: Padding(
                                padding: EdgeInsets.all(1),
                                child: CircleAvatar(
                                  radius: SWSizes.s16,
                                  backgroundColor: kColorPrimary100,
                                  child: Padding(
                                    padding: EdgeInsets.all(SWSizes.s4),
                                    child: Icon(
                                      Icons.warning_amber_rounded,
                                      color: kColorNeutral0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            ..._buildMapControl(),
          ],
        ),
      ),
    );
  }
}
