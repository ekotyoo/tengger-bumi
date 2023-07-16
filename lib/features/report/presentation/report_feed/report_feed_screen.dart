import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/models/regency.dart';
import '../../domain/report_time.dart';
import '../widgets/filter_list.dart';
import '../../../../common/routing/routes.dart';
import '../../../../utils/snackbar_utils.dart';
import '../../../../common/constants/constant.dart';
import '../../../../common/widgets/app_logo.dart';
import '../../../../common/widgets/category_chip.dart';
import '../widgets/report_card.dart';
import 'report_feed_controller.dart';

class ReportFeedScreen extends StatelessWidget {
  const ReportFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(SWStrings.labelReportTimeline),
          actions: const [AppLogo()],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: SWSizes.s16),
            const ReportFilterHeader(),
            const SizedBox(height: SWSizes.s16),
            Expanded(
              child: ReportList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportList extends ConsumerWidget {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  ReportList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportQuery = ref.watch(reportFilterStateProvider);
    final reports = ref.watch(reportFeedControllerProvider(reportQuery));

    ref.listen(
      reportFeedControllerProvider(reportQuery).selectAsync(
        (data) => data.errorMessage,
      ),
      (previous, next) async {
        final errorMessage = await next;
        if (errorMessage != null && context.mounted) {
          showSnackbar(context,
              message: errorMessage, type: SnackbarType.error);
          ref
              .read(reportFeedControllerProvider(reportQuery).notifier)
              .setErrorMessage(null);
        }
      },
    );

    ref.listen(
      reportFeedControllerProvider(reportQuery).selectAsync(
        (data) => data.successMessage,
      ),
      (previous, next) async {
        final successMessage = await next;
        if (successMessage != null && context.mounted) {
          showSnackbar(context, message: successMessage);
          ref
              .read(reportFeedControllerProvider(reportQuery).notifier)
              .setErrorMessage(null);
        }
      },
    );

    return reports.when(
      loading: () {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: SWSizes.s16),
          separatorBuilder: (context, index) =>
              const SizedBox(height: SWSizes.s16),
          itemCount: 4,
          itemBuilder: (context, index) => const ReportCardShimmer(),
        );
      },
      error: (error, stackTrace) => Text('$error'),
      data: (state) {
        final reports = state.reports;
        return RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () {
            ref.invalidate(reportFeedControllerProvider);
            return ref.read(reportFeedControllerProvider(reportQuery).future);
          },
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: SWSizes.s16),
            itemCount: reports.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: SWSizes.s16),
            itemBuilder: (context, index) {
              final report = reports[index];
              return ReportCard(
                key: ValueKey(report.id),
                report: report,
                showMenu: report.allowEdit,
                deleting: report.deleting,
                onLiked: () => ref
                    .read(reportFeedControllerProvider(reportQuery).notifier)
                    .toggleLike(index, report.id),
                onDisliked: () => ref
                    .read(reportFeedControllerProvider(reportQuery).notifier)
                    .toggleDislike(index, report.id),
                onDeleted: () => ref
                    .read(reportFeedControllerProvider(reportQuery).notifier)
                    .deleteReport(report, index),
                onEdited: () {
                  context.pushNamed(
                    Routes.editReport,
                    params: {'reportId': report.id.toString()},
                  );
                },
                onTap: () {
                  context.pushNamed(
                    Routes.reportDetail,
                    params: {'reportId': report.id.toString()},
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class ReportFilterHeader extends ConsumerWidget {
  const ReportFilterHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: SWSizes.s32,
      child: Row(
        children: [
          InkWell(
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
                builder: (context) => const ReportFilter(),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: SWSizes.s8),
              child: const Center(child: Icon(Icons.more_vert_rounded)),
            ),
          ),
        ],
      ),
    );
  }
}

class ReportFilter extends ConsumerWidget {
  const ReportFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportQuery = ref.watch(reportFilterStateProvider);
    final categoriesProvider = ref.watch(getCategoriesProvider);
    final regencies = <Regency>[];

    final titleStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.all(SWSizes.s16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Filter',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: SWSizes.s16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        SWStrings.labelPlantCategory,
                        style: titleStyle,
                      ),
                    ),
                    categoriesProvider.when(
                      data: (categories) {
                        return GestureDetector(
                          child: const Text(SWStrings.lebelSeeAll),
                          onTap: () {
                            context.pop();
                            showModalBottomSheet(
                              context: context,
                              useSafeArea: true,
                              constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(SWSizes.s32),
                                  topRight: Radius.circular(SWSizes.s32),
                                ),
                              ),
                              isScrollControlled: true,
                              builder: (context) => const CategoryFilterList(
                                label: SWStrings.labelPlantCategory,
                              ),
                            ).whenComplete(() {
                              ref.read(plantCategoryQueryProvider.notifier).updateFilterQuery('');
                            });
                          },
                        );
                      },
                      error: (error, stackTrace) => const SizedBox(),
                      loading: () => const SizedBox(),
                    ),
                  ],
                ),
                const SizedBox(height: SWSizes.s8),
                categoriesProvider.when(
                  data: (categories) {
                    return Wrap(
                      runSpacing: SWSizes.s8,
                      spacing: SWSizes.s8,
                      children: [
                        ...categories
                            .take(5)
                            .map(
                              (category) => SelectChip(
                                label: category.name,
                                selected: reportQuery.category == category,
                                onTap: () {
                                  ref
                                      .read(reportFilterStateProvider.notifier)
                                      .updateFilterState(
                                        reportQuery.copyWith(
                                          category:
                                              reportQuery.category == category
                                                  ? null
                                                  : category,
                                        ),
                                      );
                                  context.pop();
                                },
                              ),
                            )
                            .toList()
                      ],
                    );
                  },
                  error: (error, stackTrace) =>
                      Center(child: Text(error.toString())),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
                const SizedBox(height: SWSizes.s16),
                Text(
                  SWStrings.labelPlantingArea,
                  style: titleStyle,
                ),
                const SizedBox(height: SWSizes.s8),
                Wrap(
                  runSpacing: SWSizes.s8,
                  spacing: SWSizes.s8,
                  children: [
                    ...regencies
                        .map(
                          (area) => SelectChip(
                              label: area.name,
                              selected: reportQuery.regency == area,
                              onTap: () {
                                ref
                                    .read(reportFilterStateProvider.notifier)
                                    .updateFilterState(
                                      reportQuery.copyWith(
                                          regency: reportQuery.regency == area
                                              ? null
                                              : area),
                                    );
                              }),
                        )
                        .toList()
                  ],
                ),
                const SizedBox(height: SWSizes.s16),
                Text(
                  SWStrings.labelLastAdded,
                  style: titleStyle,
                ),
                const SizedBox(height: SWSizes.s8),
                Wrap(
                  runSpacing: SWSizes.s8,
                  spacing: SWSizes.s8,
                  children: [
                    ...ReportTime.values
                        .map(
                          (time) => SelectChip(
                              label: time.name,
                              selected: reportQuery.reportTime == time,
                              onTap: () {
                                ref
                                    .read(reportFilterStateProvider.notifier)
                                    .updateFilterState(
                                      reportQuery.copyWith(
                                          reportTime:
                                              reportQuery.reportTime == time
                                                  ? null
                                                  : time),
                                    );
                              }),
                        )
                        .toList()
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
