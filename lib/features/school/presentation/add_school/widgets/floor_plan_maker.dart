import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_line_editor/dragmarker.dart';
import 'package:flutter_map_line_editor/polyeditor.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../common/widgets/open_street_map_attribution.dart';
import '../../../../../common/widgets/sw_text_field.dart';
import '../../../../../common/constants/constant.dart';
import '../../models/room_ui_model.dart';

class FloorPlanMaker extends StatefulWidget {
  const FloorPlanMaker({
    Key? key,
    required this.rooms,
    this.roomEditIndex,
  }) : super(key: key);

  final List<RoomUiModel> rooms;
  final int? roomEditIndex;

  @override
  State<FloorPlanMaker> createState() => _FloorPlanMakerState();
}

class _FloorPlanMakerState extends State<FloorPlanMaker> {
  late MapController _mapController;
  late PolyEditor _polyEditor;
  late TextEditingController _labelController;
  late FollowOnLocationUpdate _followOnLocationUpdate;
  late StreamController<double?> _followCurrentLocationStreamController;

  final colors = const [
    Color(0xFFFF0000),
    Color(0xFFFFA500),
    Color(0xFFFFFF00),
    Color(0xFF008000),
    Color(0xFF0000FF),
    Color(0xFF4B0082),
    Color(0xFFEE82EE),
  ];

  final List<Polygon> _polygons = [];
  var _selectedColor = 0;
  var _polygon = Polygon(
    points: [],
    color: const Color(0xFFFF0000),
    isFilled: true,
    borderStrokeWidth: 1,
    borderColor: kColorNeutral900,
    labelStyle: const TextStyle(color: kColorNeutral900),
    rotateLabel: true,
  );
  String? _labelError;

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
    _labelController.dispose();
    _followCurrentLocationStreamController.close();
  }

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _labelController = TextEditingController();
    _followOnLocationUpdate = FollowOnLocationUpdate.never;
    _followCurrentLocationStreamController = StreamController();
    _resetPolyEditor();
    _addPolygon(_polygon);
  }

  _addPolygon(Polygon polygon) {
    _polygons.add(polygon);
  }

  _resetPolyEditor() {
    setState(() {
      _polygon = Polygon(
        points: [],
        color: colors[_selectedColor].withOpacity(.5),
        isFilled: true,
        borderStrokeWidth: 1,
        borderColor: kColorNeutral900,
        labelStyle: const TextStyle(color: kColorNeutral900),
        rotateLabel: true,
      );
      _polyEditor = PolyEditor(
        points: _polygon.points,
        addClosePathMarker: false,
        pointIcon: const Icon(
          Icons.crop_square_rounded,
          size: 23,
        ),
        intermediateIcon: const Icon(Icons.lens, size: 15, color: Colors.grey),
        callbackRefresh: () => {setState(() {})},
      );
    });
  }

  _updatePolygon({Color? color, String? label}) {
    setState(() {
      _polygon = Polygon(
        points: _polygon.points,
        color: (color ?? _polygon.color).withOpacity(.5),
        label: label ?? _polygon.label,
        isFilled: true,
        borderStrokeWidth: 1,
        borderColor: kColorNeutral900,
        labelStyle: const TextStyle(color: kColorNeutral900),
        rotateLabel: true,
      );
      _polygons.clear();
      _polygons.add(_polygon);
    });
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
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(SWStrings.labelCreateRoom),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.pop(),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              if (_polyEditor.points.length < 2) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(SWStrings.descRoomFloorPlanInvalid),
                  ),
                );
                return;
              }
              if (_labelController.text.isEmpty) {
                setState(() {
                  _labelError = SWStrings.descRoomNameCannotBeEmpty;
                });
                return;
              }
              context.pop(
                RoomUiModel(
                  id: null,
                  label: _polygons.first.label ?? '',
                  polygon: _polygons.first,
                  color: _polygons.first.color,
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: SWSizes.s16),
              child: Icon(Icons.check_rounded),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    center: LatLng(-8.069379, 111.705143),
                    zoom: 10,
                    minZoom: 1,
                    absorbPanEventsOnScrollables: false,
                    onTap: (_, point) {
                      _polyEditor.add(_polygon.points, point);
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
                      polygons: widget.rooms
                          .map(
                            (e) => Polygon(
                              points: e.polygon.points,
                              label: e.label,
                              color: e.color,
                              isFilled: true,
                              borderStrokeWidth: 1,
                              borderColor: kColorNeutral900,
                              labelStyle: const TextStyle(color: kColorNeutral900),
                            ),
                          )
                          .toList(),
                    ),
                    PolygonLayer(polygons: _polygons),
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
                    DragMarkers(markers: _polyEditor.edit()),
                  ],
                ),
                ..._buildMapControl(),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.all(SWSizes.s16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(SWStrings.labelPickColor),
                    Row(
                      children: [
                        for (var i = 0; i < colors.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(left: SWSizes.s8),
                            child: GestureDetector(
                              onTap: () {
                                setState(() => _selectedColor = i);
                                _updatePolygon(color: colors[i]);
                              },
                              child: CircleAvatar(
                                radius: SWSizes.s16 - 4,
                                backgroundColor: _selectedColor == i
                                    ? kColorPrimary200
                                    : Colors.transparent,
                                child: CircleAvatar(
                                  radius: SWSizes.s16 - 6,
                                  backgroundColor: colors[i],
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: SWSizes.s16),
                Row(
                  children: [
                    Expanded(
                      child: SWTextField(
                        controller: _labelController,
                        hint: SWStrings.labelRoomName,
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              _labelError = SWStrings.descRoomNameCannotBeEmpty;
                            });
                            return;
                          } else {
                            setState(() {
                              _labelError = null;
                            });
                          }
                          return _updatePolygon(label: value);
                        },
                        errorText: _labelError,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
