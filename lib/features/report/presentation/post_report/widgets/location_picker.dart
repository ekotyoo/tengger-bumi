import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/dragmarker.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as mp;
import 'package:polylabel/polylabel.dart';
import 'package:school_watch_semeru/common/widgets/open_street_map_attribution.dart';
import 'package:school_watch_semeru/features/school/presentation/models/floor_plan_ui_model.dart';

import '../../../../../common/constants/constant.dart';
import '../../../../../utils/snackbar_utils.dart';
import '../extensions/latlng_extenstion.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({
    Key? key,
    this.selectedPosition,
    required this.floorPlan,
  }) : super(key: key);

  final LatLng? selectedPosition;
  final FloorPlanUiModel floorPlan;

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  late MapController _mapController;
  late LatLng? _currentPosition;
  late bool _markerValid;
  late FollowOnLocationUpdate _followOnLocationUpdate;
  late StreamController<double?> _followCurrentLocationStreamController;
  late DragMarker? _marker;
  late LatLng _schoolCentroid;

  @override
  void initState() {
    super.initState();
    _markerValid = false;
    _mapController = MapController();
    _currentPosition = null;
    _followOnLocationUpdate = FollowOnLocationUpdate.never;
    _followCurrentLocationStreamController = StreamController();
    if (widget.selectedPosition != null) {
      _setNewDragMarker(widget.selectedPosition!);
    } else {
      _marker = null;
    }
    _initSchoolCentroid();
  }

  void _initSchoolCentroid() {
    final points = widget.floorPlan.rooms
        .map((e) => e.polygon.points
            .map((p) => Point(p.latitude, p.longitude))
            .toList())
        .toList();

    final result = polylabel(points).point;
    _schoolCentroid = LatLng(result.x.toDouble(), result.y.toDouble());
  }

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
    _followCurrentLocationStreamController.close();
  }

  _navigateBack(BuildContext context, {LatLng? result}) {
    context.pop(result);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(SWStrings.labelPickLocation),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              _navigateBack(context);
            },
            icon: const Icon(Icons.close_rounded),
          ),
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center: _schoolCentroid,
                zoom: 20,
                minZoom: 10,
                absorbPanEventsOnScrollables: false,
                onTap: (tapPosition, point) {
                  _setNewDragMarker(point);
                },
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
                  polygons: widget.floorPlan.rooms
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
                DragMarkers(
                  markers: [if (_marker != null) _marker!],
                ),
              ],
            ),
            ..._buildMapControl(),
            _buildSaveButton(!_markerValid),
          ],
        ),
      ),
    );
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
              onPressed: () => setState(() =>
                  _followOnLocationUpdate = FollowOnLocationUpdate.always),
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

  _buildSaveButton(bool disabled) {
    return Positioned(
      bottom: SWSizes.s32,
      left: SWSizes.s16,
      right: SWSizes.s16,
      child: ElevatedButton(
        onPressed: disabled
            ? null
            : () => _navigateBack(context, result: _currentPosition),
        child: const Text(SWStrings.labelSave),
      ),
    );
  }

  void _checkValidPoint(BuildContext context, LatLng position) {
    List<bool> insidePolygonTemp = [];

    for (var room in widget.floorPlan.rooms) {
      final polygon = room.polygon.points.map((e) => e.toMpLatLng()).toList();
      final contains = mp.PolygonUtil.containsLocation(
        position.toMpLatLng(),
        polygon,
        false,
      );

      insidePolygonTemp.add(contains);
    }

    final insidePolygon = insidePolygonTemp.any((contains) => contains);

    setState(() {
      _currentPosition = position;
      _markerValid = insidePolygon;
    });

    if (!insidePolygon) {
      showSnackbar(
        context,
        message: SWStrings.descOutsideAreaMarker,
        type: SnackbarType.error,
      );
    }
  }

  void _setNewDragMarker(LatLng point) {
    _checkValidPoint(context, point);
    setState(() {
      _marker = DragMarker(
        key: UniqueKey(),
        point: point,
        width: 80.0,
        height: 80.0,
        builder: (ctx) => const Icon(Icons.location_on, size: 50),
        offset: const Offset(0.0, -25),
        feedbackOffset: const Offset(0.0, -25),
        onDragEnd: (_, position) {
          _checkValidPoint(context, position);
        },
      );
    });
  }
}
