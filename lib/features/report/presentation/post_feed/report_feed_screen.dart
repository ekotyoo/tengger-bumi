import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_watch_semeru/features/report/domain/report_time.dart';

import '../../../../common/widgets/report_card.dart';
import '../../domain/report_status.dart';
import '../../domain/report_type.dart';
import 'reports_provider.dart';
import '../../../../common/constants/constant.dart';
import '../../../../common/widgets/app_logo.dart';
import '../../../../common/widgets/category_chip.dart';

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
    final reports = ref.watch(getReportsProvider(query: reportQuery));

    return reports.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text('$error'),
      data: (reports) => RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () {
          ref.invalidate(getReportsProvider);
          return ref.read(getReportsProvider(query: reportQuery).future);
        },
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: SWSizes.s16),
          itemCount: reports.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: SWSizes.s16);
          },
          itemBuilder: (context, index) => ReportCard(report: reports[index]),
        ),
      ),
    );
  }
}

class ReportFilterHeader extends ConsumerWidget {
  const ReportFilterHeader({
    Key? key,
  }) : super(key: key);

  final _reportTypes = ReportType.values;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportQuery = ref.watch(reportFilterStateProvider);

    return SizedBox(
      height: SWSizes.s32,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: _reportTypes.length,
              padding: const EdgeInsets.symmetric(
                horizontal: SWSizes.s16,
              ),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>
                  const SizedBox(width: SWSizes.s8),
              itemBuilder: (context, index) => SelectChip(
                label: _reportTypes[index].name,
                selected: reportQuery.reportType == _reportTypes[index],
                onTap: () {
                  ref
                      .read(reportFilterStateProvider.notifier)
                      .updateFilterState(
                        reportQuery.copyWith(reportType: _reportTypes[index]),
                      );
                },
              ),
            ),
          ),
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

    final titleStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.all(SWSizes.s16),
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
          Expanded(
            child: ListView(
              children: [
                Text(
                  SWStrings.labelReportStatus,
                  style: titleStyle,
                ),
                const SizedBox(height: SWSizes.s8),
                Wrap(
                  runSpacing: SWSizes.s8,
                  spacing: SWSizes.s8,
                  children: ReportStatus.values
                      .map(
                        (status) => SelectChip(
                          label: status.name,
                          selected: reportQuery.reportStatus == status,
                          onTap: () {
                            ref
                                .read(reportFilterStateProvider.notifier)
                                .updateFilterState(
                                  reportQuery.copyWith(reportStatus: status),
                                );
                          },
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: SWSizes.s16),
                Text(
                  SWStrings.labelReportType,
                  style: titleStyle,
                ),
                const SizedBox(height: SWSizes.s8),
                Wrap(
                  runSpacing: SWSizes.s8,
                  spacing: SWSizes.s8,
                  children: ReportType.values
                      .map(
                        (type) => SelectChip(
                            label: type.name,
                            selected: reportQuery.reportType == type,
                            onTap: () {
                              ref
                                  .read(reportFilterStateProvider.notifier)
                                  .updateFilterState(
                                    reportQuery.copyWith(reportType: type),
                                  );
                            }),
                      )
                      .toList(),
                ),
                const SizedBox(height: SWSizes.s16),
                Text(
                  SWStrings.labelReportPostTime,
                  style: titleStyle,
                ),
                const SizedBox(height: SWSizes.s8),
                Wrap(
                  spacing: SWSizes.s8,
                  children: ReportTime.values
                      .map(
                        (time) => SelectChip(
                          label: time.name,
                          onTap: () {
                            ref
                                .read(reportFilterStateProvider.notifier)
                                .updateFilterState(reportQuery.copyWith(
                                  reportTime: time,
                                ));
                          },
                          selected: reportQuery.reportTime == time,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
