import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:polylabel/polylabel.dart';
import 'package:school_watch_semeru/features/school/presentation/models/floor_plan_nav_arg.dart';

import '../../../../../common/widgets/open_street_map_attribution.dart';
import '../../models/room_ui_model.dart';
import '../../../../../common/routing/routes.dart';
import '../add_school_controller.dart';
import '../../../../../common/constants/constant.dart';
import '../../../../../common/widgets/title_with_caption.dart';

class SchoolFloorPlanForm extends ConsumerWidget {
  const SchoolFloorPlanForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addSchoolControllerProvider);

    return Column(
      children: [
        const TitleWithCaption(
          title: SWStrings.labelSchoolFloorPlan,
          caption: 'Gambar denah dari setiap ruangan yang ada di sekolah untuk melanjutkan.',
        ),
        const SizedBox(height: SWSizes.s16),
        Expanded(
          child: state.floorPlan == null || state.floorPlan!.rooms.isEmpty
              ? _buildEmptyFloorPlan(context, ref)
              : FloorPlanViewer(
                  rooms: state.floorPlan!.rooms,
                  onAddRoom: () => _navigateToFloorPlanMaker(context, ref),
                  onDeleteRoom: (room) => ref
                      .read(addSchoolControllerProvider.notifier)
                      .deleteRoom(room),
                  onRoomClick: (index) {
                    _navigateToFloorPlanMaker(context, ref,
                        roomEditIndex: index);
                  },
                ),
        ),
      ],
    );
  }

  _navigateToFloorPlanMaker(
    BuildContext context,
    WidgetRef ref, {
    int? roomEditIndex,
  }) async {
    final arg = FloorPlanNavArg(
      rooms: ref.watch(addSchoolControllerProvider).floorPlan?.rooms,
      roomEditIndex: roomEditIndex,
    );

    final newRoom = await context.pushNamed(
      Routes.floorPlanMaker,
      extra: arg,
    );

    if (newRoom != null) {
      ref
          .read(addSchoolControllerProvider.notifier)
          .addRoom(newRoom as RoomUiModel);
    }
  }

  _buildEmptyFloorPlan(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _navigateToFloorPlanMaker(context, ref),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(SWSizes.s8),
        dashPattern: const [5, 4],
        strokeWidth: 1.5,
        strokeCap: StrokeCap.round,
        color: kColorNeutral200,
        child: const SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_location_alt_outlined),
              Text(SWStrings.labelEmptyFloorPlan),
            ],
          ),
        ),
      ),
    );
  }
}

class FloorPlanViewer extends StatefulWidget {
  const FloorPlanViewer({
    Key? key,
    required this.rooms,
    this.onAddRoom,
    this.onDeleteRoom,
    this.onRoomClick,
  }) : super(key: key);

  final List<RoomUiModel> rooms;
  final VoidCallback? onAddRoom;
  final Function(RoomUiModel)? onDeleteRoom;
  final Function(int)? onRoomClick;

  @override
  State<FloorPlanViewer> createState() => _FloorPlanViewerState();
}

class _FloorPlanViewerState extends State<FloorPlanViewer> {
  late MapController _mapController;
  late LatLng _centroid;

  @override
  void initState() {
    super.initState();
    _initSchoolCentroid();
    _mapController = MapController();
  }

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
  }

  void _initSchoolCentroid() {
    final points = widget.rooms
        .map((e) => e.polygon.points
        .map((p) => Point(p.latitude, p.longitude))
        .toList())
        .toList();

    if (points.isEmpty) {
      _centroid = LatLng(-8.069379, 111.705143);
      return;
    }

    final result = polylabel(points).point;
    _centroid = LatLng(result.x.toDouble(), result.y.toDouble());
  }

  @override
  Widget build(BuildContext context) {
    final rooms = widget.rooms;

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 5 / 4,
          child: FlutterMap(
            options: MapOptions(
              minZoom: 20,
              center: _centroid,
              zoom: 20,
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
                polygons: rooms
                    .map(
                      (e) => Polygon(
                        points: e.polygon.points,
                        label: e.label,
                        color: e.color.withOpacity(.5),
                        isFilled: true,
                        borderStrokeWidth: 1,
                        borderColor: kColorNeutral900,
                        labelStyle: const TextStyle(color: kColorNeutral900),
                        rotateLabel: true,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: SWSizes.s16),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: SWSizes.s8,
              crossAxisSpacing: SWSizes.s8,
              childAspectRatio: 3.5 / 1,
            ),
            itemBuilder: (context, index) => ListTile(
              title: Text(rooms[index].label),
              onTap: () {
                // if (widget.onRoomClick == null) return;
                // widget.onRoomClick!(index);
              },
              trailing: GestureDetector(
                onTap: () {
                  if (widget.onDeleteRoom == null) return;
                  widget.onDeleteRoom!(rooms[index]);
                },
                child: const Icon(Icons.delete_outline_rounded),
              ),
            ),
            itemCount: rooms.length,
          ),
        ),
        const SizedBox(height: SWSizes.s8),
        TextButton(
          onPressed: widget.onAddRoom,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(SWStrings.labelAddRoom),
              Icon(Icons.add),
            ],
          ),
        ),
      ],
    );
  }
}
