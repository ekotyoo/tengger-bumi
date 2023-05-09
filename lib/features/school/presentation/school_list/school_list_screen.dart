import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'schools_provider.dart';
import '../../../../common/constants/constant.dart';
import '../../../../common/routing/routes.dart';
import '../../domain/school.dart';

class SchoolListScreen extends StatelessWidget {
  const SchoolListScreen({super.key});

  final isAdmin = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(SWStrings.labelSchoolList),
          centerTitle: true,
          actions: [
            if (isAdmin)
              GestureDetector(
                onTap: () => context.pushNamed(Routes.addSchool),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: SWSizes.s16),
                  child: Icon(Icons.add),
                ),
              )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SWSizes.s16),
          child: Column(
            children: [
              const SizedBox(height: SWSizes.s16),
              const SchoolSearchBar(),
              const SizedBox(height: SWSizes.s16),
              Expanded(child: SchoolList()),
            ],
          ),
        ),
      ),
    );
  }
}

class SchoolSearchBar extends ConsumerWidget {
  const SchoolSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      maxLines: 1,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: const InputDecoration(
        hintText: SWStrings.labelSearchSchool,
        suffixIcon: Icon(Icons.search_rounded),
      ),
      onChanged: (value) {
        ref.read(schoolSearchQueryProvider.notifier).updateSearchQuery(value);
      },
    );
  }
}

class SchoolCard extends StatelessWidget {
  const SchoolCard({
    Key? key,
    required this.school,
    this.onTap,
  }) : super(key: key);

  final School school;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                Text(
                  school.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
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
                  value: 'Rendah',
                ),
                _buildSchoolAnalysisInfo(
                  context,
                  label: 'Tanggap Darurat',
                  value: 'Rendah',
                ),
                _buildSchoolAnalysisInfo(
                  context,
                  label: 'Pemulihan',
                  value: 'Rendah',
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

class SchoolList extends ConsumerWidget {
  SchoolList({
    Key? key,
  }) : super(key: key);

  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(schoolSearchQueryProvider);
    final schools = ref.watch(getSchoolsProvider(query: searchQuery));

    return schools.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text('$error'),
      data: (schools) => RefreshIndicator(
        key: refreshIndicatorKey,
        onRefresh: () => Future.delayed(kDurationLong),
        child: ListView.separated(
          itemCount: schools.length,
          itemBuilder: (context, index) {
            final school = schools[index];
            return SchoolCard(
              school: school,
              onTap: () {
                context.pushNamed(
                  Routes.schoolDetail,
                  params: {'schoolId' : school.id },
                );
              },
            );
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: SWSizes.s8),
        ),
      ),
    );
  }
}
