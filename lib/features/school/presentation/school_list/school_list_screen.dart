import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/analysis_utils.dart';
import '../../../auth/data/auth_repository.dart';
import 'schools_provider.dart';
import '../../../../common/constants/constant.dart';
import '../../../../common/routing/routes.dart';
import '../../domain/school.dart';

class SchoolListScreen extends ConsumerWidget {
  const SchoolListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(SWStrings.labelBookmarkList),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SWSizes.s16),
          child: Column(
            children: [
              const SizedBox(height: SWSizes.s16),
              Expanded(child: BookmarkList()),
            ],
          ),
        ),
      ),
    );
  }
}

class SchoolCard extends StatelessWidget {
  const SchoolCard({
    Key? key,
    required this.school,
    this.onTap,
    this.onEdit,
    this.showEditButton = false,
  }) : super(key: key);

  final School school;
  final VoidCallback? onTap;
  final bool showEditButton;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.all(SWSizes.s16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SWSizes.s8),
          color: kColorPrimary50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.home_work_outlined),
                const SizedBox(width: SWSizes.s8),
                Expanded(
                  child: Text(
                    school.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                if (showEditButton)
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: onEdit,
                    child: const Icon(Icons.edit),
                  ),
              ],
            ),
            const SizedBox(height: SWSizes.s16),
            Text(
              'Analisis Sekolah:',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: SWSizes.s4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSchoolAnalysisInfo(
                  context,
                  label: 'Pencegahan',
                  color: getColorFromAnalysisScore(
                      school.analysis.preventionLevel),
                  value: getLabelFromAnalysisScore(
                      school.analysis.preventionLevel),
                ),
                _buildSchoolAnalysisInfo(
                  context,
                  label: 'Tanggap Darurat',
                  color: getColorFromAnalysisScore(
                      school.analysis.emergencyResponseLevel),
                  value: getLabelFromAnalysisScore(
                      school.analysis.emergencyResponseLevel),
                ),
                _buildSchoolAnalysisInfo(
                  context,
                  label: 'Pemulihan',
                  color:
                      getColorFromAnalysisScore(school.analysis.recoveryLevel),
                  value:
                      getLabelFromAnalysisScore(school.analysis.recoveryLevel),
                ),
              ],
            ),
          ],
        ),
      ),
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

class BookmarkList extends ConsumerWidget {
  BookmarkList({
    Key? key,
  }) : super(key: key);

  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarksAsync = ref.watch(getBookmarksProvider);

    return bookmarksAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text('$error'),
      data: (bookmarks) => RefreshIndicator(
        key: refreshIndicatorKey,
        onRefresh: () {
          ref.invalidate(getSchoolsProvider);
          return ref.read(getSchoolsProvider.future);
        },
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: SWSizes.s8,
            mainAxisSpacing: SWSizes.s8,
          ),
          itemCount: bookmarks.length,
          itemBuilder: (context, index) {
            final plant = bookmarks[index];
            return InkWell(
              onTap: () {
                context.pushNamed(
                  Routes.reportDetail,
                  params: {'reportId': plant.id.toString()},
                );
              },
              child: Image.network(plant.images.first, fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}
