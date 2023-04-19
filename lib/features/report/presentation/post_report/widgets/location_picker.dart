import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/dragmarker.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as mp;

import '../../../../../common/constants/constant.dart';
import '../extensions/latlng_extenstion.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({Key? key}) : super(key: key);

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  late MapController _mapController;
  late LatLng? _currentPosition;
  late bool _markerValid;
  late FollowOnLocationUpdate _followOnLocationUpdate;
  late StreamController<double?> _followCurrentLocationStreamController;

  final _testPolygonPoints = [
    LatLng(-8.069379, 111.705143),
    LatLng(-8.069397, 111.705259),
    LatLng(-8.069497, 111.705246),
    LatLng(-8.069480, 111.705131),
  ];

  late DragMarker? _marker;

  @override
  void initState() {
    super.initState();
    _markerValid = false;
    _mapController = MapController();
    _currentPosition = null;
    _followOnLocationUpdate = FollowOnLocationUpdate.never;
    _followCurrentLocationStreamController = StreamController();
    _marker = null;
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
                center: LatLng(-8.069379, 111.705143),
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
                          () =>
                      _followOnLocationUpdate =
                          FollowOnLocationUpdate.never,
                    );
                  }
                },
              ),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: 'OpenStreetMap contributors',
                  onSourceTapped: null,
                ),
              ],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.ekotyoo.school_watch_semeru',
                  maxNativeZoom: 19,
                  maxZoom: 35,
                ),
                PolygonLayer(
                  polygons: [
                    Polygon(
                        points: _testPolygonPoints,
                        borderColor: Colors.black,
                        color: Colors.yellow,
                        borderStrokeWidth: 2,
                        isFilled: true,
                        label: 'Kelas 1',
                        labelStyle: const TextStyle(color: Colors.black),
                        rotateLabel: true,
                        isDotted: true),
                  ],
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
                  markers: [
                    if (_marker != null) _marker!
                  ],
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
              onPressed: () {
                setState(() {
                  _followOnLocationUpdate = FollowOnLocationUpdate.always;
                });
              },
              icon: const CircleAvatar(
                child: Icon(Icons.my_location),
              ),
            ),
            IconButton(
              iconSize: SWSizes.s32 + SWSizes.s8,
              onPressed: () {
                _mapController.move(LatLng(-8.069379, 111.705143), 21);
              },
              icon: const CircleAvatar(
                child: Icon(Icons.home),
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
    final insidePolygon = mp.PolygonUtil.containsLocation(
      position.toMpLatLng(),
      _testPolygonPoints.map((e) => e.toMpLatLng()).toList(),
      false,
    );

    setState(() {
      _currentPosition = position;
      _markerValid = insidePolygon;
    });

    if (!insidePolygon) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(SWStrings.descOutsideAreaMarker),
        ),
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
        builder: (ctx) =>
        const Icon(Icons.location_on, size: 50),
        offset: const Offset(0.0, -25),
        feedbackOffset: const Offset(0.0, -25),
        onDragEnd: (_, position) {
          _checkValidPoint(context, position);
        },
      );
    });
  }
}
