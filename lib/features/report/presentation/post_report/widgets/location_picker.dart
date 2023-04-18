import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/dragmarker.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../common/constants/constant.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({Key? key}) : super(key: key);

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  late MapController _mapController;

  var _currentPosition = LatLng(-7.963005, 112.632641);

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
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
                center: _currentPosition,
                zoom: 9.2,
                minZoom: 5,
                absorbPanEventsOnScrollables: false,
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
                  userAgentPackageName: 'com.example.app',
                  maxNativeZoom: 21,
                  maxZoom: 35,
                ),
                DragMarkers(
                  markers: [
                    DragMarker(
                      onDragEnd: (_, position) {
                        _currentPosition = position;
                      },
                      key: const ValueKey(1),
                      point: LatLng(-7.963005, 112.632641),
                      width: 80.0,
                      height: 80.0,
                      builder: (ctx) => const Icon(Icons.location_on, size: 50),
                      feedbackBuilder: (ctx) =>
                          const Icon(Icons.edit_location, size: 75),
                      offset: const Offset(0.0, -8.0),
                    ),
                  ],
                ),
              ],
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
                          _mapController.center, currentZoom + 1);
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
                          _mapController.center, currentZoom - 1);
                    },
                    icon: const CircleAvatar(
                      child: Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: SWSizes.s32,
              left: SWSizes.s16,
              right: SWSizes.s16,
              child: ElevatedButton(
                onPressed: () {
                  _navigateBack(context, result: _currentPosition);
                },
                child: const Text(SWStrings.labelSave),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
