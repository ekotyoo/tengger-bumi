import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_line_editor/dragmarker.dart';
import 'package:flutter_map_line_editor/polyeditor.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../common/widgets/sw_text_field.dart';
import '../../../../../common/constants/constant.dart';
import '../../models/room.dart';

class FloorPlanMaker extends StatefulWidget {
  const FloorPlanMaker({
    Key? key,
    required this.rooms,
    this.roomEditIndex,
  }) : super(key: key);

  final List<Room> rooms;
  final int? roomEditIndex;

  @override
  State<FloorPlanMaker> createState() => _FloorPlanMakerState();
}

class _FloorPlanMakerState extends State<FloorPlanMaker> {
  late MapController _mapController;
  late PolyEditor _polyEditor;
  late TextEditingController _labelController;

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

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
    _labelController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _labelController = TextEditingController();
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
            onTap: () => context.pop(
              Room(
                label: _polygons.first.label ?? '',
                polygon: _polygons.first,
                color: _polygons.first.color,
              ),
            ),
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
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center: LatLng(-8.069379, 111.705143),
                zoom: 20,
                minZoom: 10,
                absorbPanEventsOnScrollables: false,
                onTap: (_, point) {
                  _polyEditor.add(_polygon.points, point);
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
                DragMarkers(markers: _polyEditor.edit()),
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
                        onChanged: (value) => _updatePolygon(label: value),
                      ),
                    ),
                    const SizedBox(width: SWSizes.s16),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(SWSizes.s4),
                          decoration: BoxDecoration(
                            color: kColorPrimary50,
                            borderRadius: BorderRadius.circular(SWSizes.s8),
                          ),
                          child: const Center(child: Icon(Icons.restart_alt)),
                        ),
                        const SizedBox(height: SWSizes.s4),
                        const Text(SWStrings.labelReset),
                      ],
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
