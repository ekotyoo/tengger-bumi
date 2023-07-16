import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:school_watch_semeru/features/report/presentation/map/plants_map_provider.dart';
import '../../../../common/widgets/open_street_map_attribution.dart';

import '../../../../common/routing/routes.dart';
import '../../../../common/constants/constant.dart';
import '../../../../common/widgets/sw_button.dart';
import '../widgets/report_card.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  late MapController _mapController;
  late PageController _pageController;
  late FollowOnLocationUpdate _followOnLocationUpdate;
  late StreamController<double?> _followCurrentLocationStreamController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _pageController = PageController(viewportFraction: 1.1);
    _followOnLocationUpdate = FollowOnLocationUpdate.never;
    _followCurrentLocationStreamController = StreamController();
  }

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
    _pageController.dispose();
    _followCurrentLocationStreamController.close();
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
    final plantsMapAsync = ref.watch(getPlantsMapProvider);

    final defaultCentroid = LatLng(-2.5489, 118.0149);
    final defaultMapOption = MapOptions(
      center: defaultCentroid,
      zoom: 10,
      minZoom: 1,
      absorbPanEventsOnScrollables: false,
      onPositionChanged: (MapPosition position, bool hasGesture) {
        if (hasGesture &&
            _followOnLocationUpdate != FollowOnLocationUpdate.never) {
          setState(
            () => _followOnLocationUpdate = FollowOnLocationUpdate.never,
          );
        }
      },
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Peta'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: plantsMapAsync.when(
                data: (plants) {
                  return MapOptions(
                    zoom: 10,
                    minZoom: 1,
                    absorbPanEventsOnScrollables: false,
                    onPositionChanged: (MapPosition position, bool hasGesture) {
                      if (hasGesture &&
                          _followOnLocationUpdate !=
                              FollowOnLocationUpdate.never) {
                        setState(
                          () => _followOnLocationUpdate =
                              FollowOnLocationUpdate.never,
                        );
                      }
                    },
                  );
                },
                error: (error, stackTrace) => defaultMapOption,
                loading: () => defaultMapOption,
              ),
              nonRotatedChildren: const [
                OpenStreetMapAttribution(),
              ],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.ekotyoo.school_watch_semeru',
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
                plantsMapAsync.when(
                  data: (plants) => MarkerLayer(
                    markers: plants
                        .mapWithIndex(
                          (plant, index) => Marker(
                            key: ValueKey(plant.id),
                            width: SWSizes.s40,
                            height: SWSizes.s40,
                            point: LatLng(plant.position.latitude,
                                plant.position.longitude),
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
                                  isScrollControlled: true,
                                  builder: (context) => Padding(
                                    padding: const EdgeInsets.all(SWSizes.s16),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          ReportCard(
                                              report: plant,
                                              showInteractionBar: false),
                                          const SizedBox(height: SWSizes.s16),
                                          SWButton(
                                            label: SWStrings.labelSeeMore,
                                            onPressed: () => context.pushNamed(
                                              Routes.reportDetail,
                                              params: {
                                                'reportId': plant.id.toString()
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
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
                  error: (error, stackTrace) => Container(),
                  loading: () => Container(),
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