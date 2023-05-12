import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:go_router/go_router.dart';
import 'package:school_watch_semeru/features/school/presentation/models/floor_plan_ui_model.dart';
import 'package:school_watch_semeru/features/school/presentation/models/school_detail_floor_plan_nav_arg.dart';

import '../../../../common/models/position.dart';
import 'school_detail_controller.dart';
import '../../../../common/routing/routes.dart';
import '../../../../common/widgets/title_with_caption.dart';
import '../../../report/domain/author.dart';
import '../../../report/domain/report.dart';
import '../../../report/domain/report_type.dart';
import '../../../report/presentation/widgets/report_card.dart';
import '../../../../common/widgets/loading_image.dart';
import '../../../../common/constants/constant.dart';

class SchoolDetailScreen extends ConsumerWidget {
  const SchoolDetailScreen({
    Key? key,
    required this.schoolId,
  }) : super(key: key);

  final String schoolId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportDetailAsync =
        ref.watch(schoolDetailControllerProvider(schoolId));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(SWStrings.labelSchoolDetail),
          centerTitle: true,
          actions: [
            reportDetailAsync.when(
              data: (reportDetail) {
                if (reportDetail == null) return Container();

                return IconButton(
                icon: const Icon(Icons.location_on_rounded),
                onPressed: () => context.pushNamed(
                  Routes.schoolFloorPlan,
                  params: {'schoolId': schoolId},
                  extra: SchoolDetailFloorPlanNavArg(
                    floorPlan: FloorPlanUiModel.fromDomain(reportDetail.floorPlan),
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
        body: reportDetailAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Text('$error'),
          data: (reportDetail) => Padding(
            padding: const EdgeInsets.all(SWSizes.s16),
            child: ListView(
              children: [
                _buildSchoolHeader(context),
                const SizedBox(height: SWSizes.s16),
                _buildSchoolAnalysis(context),
                const SizedBox(height: SWSizes.s8),
                const Divider(),
                const SizedBox(height: SWSizes.s8),
                const ReportListWithFilter(),
                const SizedBox(height: SWSizes.s8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildSchoolHeader(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SWSizes.s8),
      child: Stack(
        children: [
          const LoadingImage(
            url: 'https://picsum.photos/200/100',
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: kColorNeutral900.withOpacity(0.4),
            height: 160,
            width: double.infinity,
          ),
          Positioned(
            bottom: SWSizes.s16,
            left: SWSizes.s16,
            right: SWSizes.s16,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 2 * SWSizes.s16,
              child: Row(
                children: [
                  const Icon(
                    Icons.home_work_outlined,
                    size: SWSizes.s32,
                    color: kColorNeutral0,
                  ),
                  const SizedBox(width: SWSizes.s8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'SDN 2 Sidomulyo',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: kColorNeutral0,
                            ),
                      ),
                      Text(
                        'Asd asdfasdf asdfasd',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: kColorNeutral0),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildSchoolAnalysis(context) {
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
                value: 'Baik',
              ),
              _buildSchoolAnalysisInfo(
                context,
                label: 'Tanggap Darurat',
                value: 'Baik',
              ),
              _buildSchoolAnalysisInfo(
                context,
                label: 'Pemulihan',
                value: 'Baik',
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
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
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
  const ReportListWithFilter({Key? key}) : super(key: key);

  @override
  State<ReportListWithFilter> createState() => _ReportListWithFilterState();
}

class _ReportListWithFilterState extends State<ReportListWithFilter>
    with SingleTickerProviderStateMixin {
  int _selectedTab = 0;
  late List<ReportType> reportTypes;

  @override
  void initState() {
    reportTypes = ReportType.values.filter((t) => t != ReportType.all).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTab(context),
        const SizedBox(height: SWSizes.s16),
        _buildReportList(context),
      ],
    );
  }

  _buildTab(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < reportTypes.length; i++)
          _buildTabItem(
            context,
            label: reportTypes[i].name,
            selected: _selectedTab == i,
            onTap: () => setState(() => _selectedTab = i),
          ),
      ],
    );
  }

  _buildTabItem(
    BuildContext context, {
    required String label,
    required bool selected,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: selected ? kColorPrimary500 : kColorNeutral50),
          ),
          const SizedBox(height: SWSizes.s4),
          Container(
            height: 3,
            width: SWSizes.s56,
            color: selected
                ? kColorPrimary500
                : Theme.of(context).scaffoldBackgroundColor,
          ),
        ],
      ),
    );
  }

  _buildReportList(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ReportCard(
        report: Report(
          id: '$index',
          reportType: 'Pencegahan',
          reportCategory: 'Category',
          description: SWStrings.dummyText,
          images: [
            'https://picsum.photos/200/100',
            'https://picsum.photos/200/100'
          ],
          author: Author(
              id: '$index',
              name: 'John Doe - $index',
              avatar: 'https://picsum.photos/200/100'),
          school: 'SDN 2 Sidomulyo',
          position: const Position(latitude: .0, longitude: .0),
          createdAt: DateTime.now(),
          likesCount: 10,
          dislikesCount: 10,
          commentsCount: 10,
          isActive: true,
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: SWSizes.s8),
    );
  }
}
