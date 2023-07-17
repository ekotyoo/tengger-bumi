import 'package:flutter/material.dart';
import 'package:flutter_color_utils/flutter_color_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tetenger_bumi/features/auth/presentation/profile/profile_state.dart';
import 'package:tetenger_bumi/features/school/domain/school_analysis.dart';
import 'package:tetenger_bumi/features/school/domain/school_detail.dart';
import '../../../../common/models/statistic.dart';
import '../../../../utils/analysis_utils.dart';
import '../models/floor_plan_ui_model.dart';
import '../models/school_detail_floor_plan_nav_arg.dart';

import 'school_detail_controller.dart';
import '../../../../common/routing/routes.dart';
import '../../../../common/widgets/title_with_caption.dart';
import '../../../report/domain/plant.dart';
import '../../../report/domain/report_type.dart';
import '../../../report/presentation/widgets/report_card.dart';
import '../../../../common/widgets/loading_image.dart';
import '../../../../common/constants/constant.dart';

class SchoolDetailScreen extends ConsumerWidget {
  SchoolDetailScreen({
    Key? key,
    required this.schoolId,
  }) : super(key: key);

  final int schoolId;
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schoolDetailAsync =
        ref.watch(schoolDetailControllerProvider(schoolId));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(SWStrings.labelPlantDetail),
          centerTitle: true,
          actions: [
            schoolDetailAsync.when(
              data: (reportDetail) {
                if (reportDetail == null) return Container();

                return IconButton(
                  icon: const Icon(Icons.location_on_rounded),
                  onPressed: () => context.pushNamed(
                    Routes.schoolFloorPlan,
                    params: {'schoolId': schoolId.toString()},
                    extra: SchoolDetailFloorPlanNavArg(
                      floorPlan:
                          FloorPlanUiModel.fromDomain(reportDetail.floorPlan),
                      reports: reportDetail.reports,
                    ),
                  ),
                );
              },
              error: (error, stackTrace) => Container(),
              loading: () => Container(),
            ),
          ],
        ),
        body: schoolDetailAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Text('$error'),
          data: (reportDetail) {
            if (reportDetail == null) {
              return const Center(child: Text('Data sekolah tidak ditemukan'));
            }

            return RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () {
                ref.invalidate(schoolDetailControllerProvider(schoolId));
                return ref
                    .read(schoolDetailControllerProvider(schoolId).future);
              },
              child: Padding(
                padding: const EdgeInsets.all(SWSizes.s16),
                child: ListView(
                  children: [
                    _buildSchoolHeader(context, reportDetail),
                    const SizedBox(height: SWSizes.s16),
                    _buildSchoolAnalysis(context, reportDetail.analysis),
                    const SizedBox(height: SWSizes.s8),
                    const Divider(),
                    const SizedBox(height: SWSizes.s8),
                    ReportListWithFilter(reports: reportDetail.reports),
                    const SizedBox(height: SWSizes.s8),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _buildSchoolHeader(BuildContext context, SchoolDetail reportDetail) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SWSizes.s8),
      child: Stack(
        children: [
          LoadingImage(
            url: reportDetail.image ?? '',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: kColorNeutral900.withOpacity(0.4),
            height: 200,
            width: double.infinity,
          ),
          Positioned(
            bottom: SWSizes.s16,
            left: SWSizes.s16,
            right: SWSizes.s16,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 2 * SWSizes.s16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.home_work_outlined,
                    size: SWSizes.s32,
                    color: kColorNeutral0,
                  ),
                  const SizedBox(width: SWSizes.s8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          reportDetail.name,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: kColorNeutral0,
                                  ),
                        ),
                        Text(
                          reportDetail.address,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: kColorNeutral0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildSchoolAnalysis(context, SchoolAnalysis analysis) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const TitleWithCaption(title: 'Analisis Sekolah'),
            const SizedBox(width: SWSizes.s4),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.info_outline_rounded,
                color: kColorNeutral50,
                size: SWSizes.s16,
              ),
            ),
          ],
        ),
        const SizedBox(height: SWSizes.s8),
        Container(
          padding: const EdgeInsets.all(SWSizes.s16),
          decoration: BoxDecoration(
            color: kColorPrimary50,
            borderRadius: BorderRadius.circular(SWSizes.s8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSchoolAnalysisInfo(
                context,
                label: 'Pencegahan',
                color: getColorFromAnalysisScore(analysis.preventionLevel),
                value: getLabelFromAnalysisScore(analysis.preventionLevel),
              ),
              _buildSchoolAnalysisInfo(
                context,
                label: 'Tanggap Darurat',
                color:
                    getColorFromAnalysisScore(analysis.emergencyResponseLevel),
                value:
                    getLabelFromAnalysisScore(analysis.emergencyResponseLevel),
              ),
              _buildSchoolAnalysisInfo(
                context,
                label: 'Pemulihan',
                color: getColorFromAnalysisScore(analysis.recoveryLevel),
                value: getLabelFromAnalysisScore(analysis.recoveryLevel),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildSchoolAnalysisInfo(
    BuildContext context, {
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: SWSizes.s8),
        CircleAvatar(
          radius: 12,
          backgroundColor: kColorNeutral0,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: color,
          ),
        ),
        const SizedBox(height: SWSizes.s8),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class ReportListWithFilter extends StatefulWidget {
  const ReportListWithFilter(
      {Key? key,
      this.reports = const [],
      this.stats = const [],
      this.total = 0})
      : super(key: key);

  final List<Plant> reports;
  final List<Statistic> stats;
  final int total;

  @override
  State<ReportListWithFilter> createState() => _ReportListWithFilterState();
}

class _ReportListWithFilterState extends State<ReportListWithFilter>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  late List<ReportType> reportTypes;
  late List<Plant> _reports;
  late List<Statistic> _stats;
  late int _total;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    reportTypes = ReportType.values;
    _reports = widget.reports;
    _stats = widget.stats;
    _total = widget.total;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       _buildTab(context),
  //       const SizedBox(height: SWSizes.s16),
  //       _buildReportList(context, _reports),
  //       _buildPostStatistic()
  //       // Text("data")
  //     ],
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              labelColor: kColorPrimary,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.photo), Text('Postingan')],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(AssetImage('assets/images/penanaman.png')),
                      Text('Penanaman')
                    ],
                  ),
                ),
              ],
              controller: tabController,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                  tabController.animateTo(index);
                });
              },
            ),
            IndexedStack(
              index: selectedIndex,
              children: [
                SizedBox(
                    height: selectedIndex == 0 ? null : 1,
                    child: _buildReportList(context, _reports)),
                SizedBox(
                    height: selectedIndex == 1 ? null : 1,
                    child: _buildPostStatistic(context, _stats, _total))
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildReportList(BuildContext context, List<Plant> reports) {
    const emptyPlaceholder = Padding(
      padding: EdgeInsets.only(top: SWSizes.s16),
      child: Center(child: Text('Belum ada data penanaman')),
    );

    return reports.isEmpty
        ? emptyPlaceholder
        : ListView.separated(
            padding: const EdgeInsetsDirectional.only(top: 6),
            itemCount: reports.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ReportCard(
              report: reports[index],
              showInteractionBar: false,
              onTap: () {
                context.pushNamed(
                  Routes.reportDetail,
                  params: {'reportId': reports[index].id.toString()},
                );
              },
            ),
            separatorBuilder: (context, index) =>
                const SizedBox(height: 6),
          );
  }

  _buildPostStatistic(BuildContext context, List<Statistic> stats, int total) {
    const emptyPlaceholder = Padding(
      padding: EdgeInsets.only(top: SWSizes.s16),
      child: Expanded(child: Center(child: Text('Belum ada data penanaman'))),
    );
    return stats.isEmpty
        ? emptyPlaceholder
        : Column(
            children: [
              const SizedBox(height: SWSizes.s16),
              Text(
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  'Jumlah Penanaman : $total'),
              const SizedBox(height: SWSizes.s4),

              for (int i = 0; i < stats.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: SWSizes.s4),
                  child: Row(
                    children: [
                      Image.network(
                        stats[i].icon,
                        width: 40,
                        headers: {
                          "Keep-Alive": "timeout=30,max=100",
                          "Connection" : "Keep-Alive"
                        },
                      ),
                      const SizedBox(
                        width: SWSizes.s8,
                      ),
                      Expanded(
                          child: Text(
                        stats[i].name,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                      const SizedBox(
                        width: SWSizes.s8,
                      ),
                      Text(stats[i].count.toString()),
                    ],
                  ),
                ),
              const SizedBox(
                height: SWSizes.s8,
              ),
            ],
          );
  }
}
