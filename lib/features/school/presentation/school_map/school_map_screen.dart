import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:school_watch_semeru/common/widgets/open_street_map_attribution.dart';

import '../../../../common/routing/routes.dart';
import '../school_list/school_list_screen.dart';
import '../school_list/schools_provider.dart';
import '../../../../common/constants/constant.dart';

class SchoolMapScreen extends ConsumerStatefulWidget {
  const SchoolMapScreen({super.key});

  @override
  ConsumerState<SchoolMapScreen> createState() => _SchoolMapScreenState();
}

class _SchoolMapScreenState extends ConsumerState<SchoolMapScreen> {
  late MapController _mapController;
  late PageController _pageController;
  late FollowOnLocationUpdate _followOnLocationUpdate;
  late StreamController<double?> _followCurrentLocationStreamController;

  int? _selectedSchool;

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
    final reportsAsync = ref.watch(getSchoolsProvider());

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
              options: MapOptions(
                center: LatLng(-7.956197, 112.627658),
                zoom: 10,
                minZoom: 1,
                absorbPanEventsOnScrollables: false,
                onTap: (_, point) {},
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
                reportsAsync.when(
                  data: (reports) => MarkerLayer(
                    markers: reports
                        .mapWithIndex(
                          (report, index) => Marker(
                            width: SWSizes.s40,
                            height: SWSizes.s40,
                            point: LatLng(
                              report.schoolLocation.latitude,
                              report.schoolLocation.longitude,
                            ),
                            rotate: true,
                            builder: (context) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedSchool = index;
                                });
                                _pageController.jumpToPage(index);
                              },
                              child: CircleAvatar(
                                backgroundColor: _selectedSchool == index
                                    ? kColorNeutral0
                                    : kColorPrimary100,
                                child: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: CircleAvatar(
                                    radius: SWSizes.s16,
                                    backgroundColor: _selectedSchool == index
                                        ? Theme.of(context).primaryColor
                                        : kColorPrimary100,
                                    child: const Padding(
                                      padding: EdgeInsets.all(SWSizes.s4),
                                      child: Icon(
                                        Icons.home_work_outlined,
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
              ],
            ),
            reportsAsync.when(
              data: (schools) => _selectedSchool == null
                  ? Container()
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 200),
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: schools.length,
                          onPageChanged: (index) =>
                              setState(() => _selectedSchool = index),
                          itemBuilder: (context, index) {
                            final school = schools[index];

                            return FractionallySizedBox(
                              widthFactor: 1 / _pageController.viewportFraction,
                              child: Padding(
                                padding: const EdgeInsets.all(SWSizes.s16),
                                child: SchoolCard(
                                  school: school,
                                  onTap: () {
                                    context.pushNamed(
                                      Routes.schoolDetail,
                                      params: {'schoolId': school.id},
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
              error: (error, stackTrace) => Container(),
              loading: () => Container(
                color: kColorNeutral900.withOpacity(0.2),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            ..._buildMapControl(),
          ],
        ),
      ),
    );
  }
}
