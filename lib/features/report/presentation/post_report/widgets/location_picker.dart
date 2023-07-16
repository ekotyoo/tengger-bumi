import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/dragmarker.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../../../../../common/widgets/open_street_map_attribution.dart';
import '../../../../../common/constants/constant.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({
    Key? key,
    this.selectedPosition,
  }) : super(key: key);

  final LatLng? selectedPosition;

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
  LatLng? currentDetectedPosition;
  late  Location location;

  @override
  void initState() {
    super.initState();
    location = Location();
    _markerValid = false;
    _mapController = MapController();
    _currentPosition = null;
    _followOnLocationUpdate = FollowOnLocationUpdate.always;
    _followCurrentLocationStreamController = StreamController();
    if (widget.selectedPosition != null) {
      _setNewDragMarker(widget.selectedPosition!);
    } else {
      _marker = null;
    }

    // location.onLocationChanged.listen((event) {
    //   setState(() => currentDetectedPosition =
    //       LatLng(event.latitude ?? 0.0, event.longitude ?? 0.0));
    //   debugPrint(currentDetectedPosition.toString());
    // });
    // _initSchoolCentroid();
  }

  // void _initSchoolCentroid() {
  //   final points = widget.floorPlan.rooms
  //       .map((e) => e.polygon.points
  //           .map((p) => Point(p.latitude, p.longitude))
  //           .toList())
  //       .toList();
  //
  //   final result = polylabel(points).point;
  // _schoolCentroid = LatLng(result.x.toDouble(), result.y.toDouble());
  // }

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
    _followCurrentLocationStreamController.close();
  }

  _navigateBack(BuildContext context, {LatLng? position}) {
    context.pop({
      'position': position
    });
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
                zoom: 20,
                minZoom: 3,
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
                  userAgentPackageName: 'com.ekotyoo.tetenger_bumi',
                  maxNativeZoom: 19,
                  maxZoom: 35,
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
              onPressed: () async {
                setState(() =>
                    _followOnLocationUpdate = FollowOnLocationUpdate.always);
                var locationData = await location.getLocation();
                var currentDetectedPosition = LatLng(locationData.latitude??0.0, locationData.longitude??0.0);
                _setNewDragMarker(currentDetectedPosition);
              },
              icon: const CircleAvatar(
                child: Icon(Icons.my_location),
              ),
            ),
            // IconButton(
            //   iconSize: SWSizes.s32 + SWSizes.s8,
            //   onPressed: () {
            //     setState(() =>
            //         _followOnLocationUpdate = FollowOnLocationUpdate.never);
            //     _mapController.move(_schoolCentroid, 21);
            //   },
            //   icon: const CircleAvatar(
            //     child: Icon(Icons.home_work_outlined),
            //   ),
            // ),
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
            : () => _navigateBack(context,
                position: _currentPosition),
        child: const Text(SWStrings.labelSave),
      ),
    );
  }

  void _setNewDragMarker(LatLng point) {
    setState(() {
      _currentPosition = point;
      _markerValid = true;
      _marker = DragMarker(
        key: UniqueKey(),
        point: point,
        width: 80.0,
        height: 80.0,
        builder: (ctx) => const Icon(Icons.location_on, size: 50),
        offset: const Offset(0.0, -25),
        feedbackOffset: const Offset(0.0, -25),
      );
    });
  }
}
