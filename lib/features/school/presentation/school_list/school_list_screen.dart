import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rainbow_color/rainbow_color.dart';

import '../../../auth/data/auth_repository.dart';
import 'schools_provider.dart';
import '../../../../common/constants/constant.dart';
import '../../../../common/routing/routes.dart';
import '../../domain/school.dart';

class SchoolListScreen extends ConsumerWidget {
  const SchoolListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdmin = ref.watch(authStateProvider).map(
          signedIn: (value) => value.isAdmin,
          signedOut: (value) => false,
        );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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

class SchoolSearchBar extends ConsumerStatefulWidget {
  const SchoolSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SchoolSearchBarState();
}

class _SchoolSearchBarState extends ConsumerState<SchoolSearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    final text = ref.read(schoolSearchQueryProvider);
    _controller = TextEditingController(text: text);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: 1,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: const InputDecoration(
        hintText: SWStrings.labelSearchSchool,
        suffixIcon: Icon(Icons.search_rounded),
      ),
      onChanged: (value) =>
          ref.read(schoolSearchQueryProvider.notifier).updateSearchQuery(value),
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

  Color getColorFromDouble(double? value) {
    if (value == null) return kColorNeutral200;
    final colors = Rainbow(
      spectrum: [Colors.red, Colors.yellow, Colors.green],
      rangeStart: 0.0,
      rangeEnd: 1.0,
    );

    final color = colors[value];
    return color;
  }

  String getAnalysisLevelFromDouble(double? value) {
    if (value == null) return '-';
    final score = (value * 100).toInt();

    if (score >= 61 && score <= 100) {
      return 'Baik';
    } else if (score >= 34 && score <= 66) {
      return 'Cukup';
    }

    return 'Rendah';
  }

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
                  color: getColorFromDouble(school.analysis.preventionLevel),
                  value: getAnalysisLevelFromDouble(
                      school.analysis.preventionLevel),
                ),
                _buildSchoolAnalysisInfo(
                  context,
                  label: 'Tanggap Darurat',
                  color: getColorFromDouble(
                      school.analysis.emergencyResponseLevel),
                  value: getAnalysisLevelFromDouble(
                      school.analysis.emergencyResponseLevel),
                ),
                _buildSchoolAnalysisInfo(
                  context,
                  label: 'Pemulihan',
                  color: getColorFromDouble(school.analysis.recoveryLevel),
                  value:
                      getAnalysisLevelFromDouble(school.analysis.recoveryLevel),
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

class SchoolList extends ConsumerWidget {
  SchoolList({
    Key? key,
  }) : super(key: key);

  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schools = ref.watch(getSchoolsProvider);

    return schools.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text('$error'),
      data: (schools) => RefreshIndicator(
        key: refreshIndicatorKey,
        onRefresh: () {
          ref.invalidate(getSchoolsProvider);
          return ref.read(getSchoolsProvider.future);
        },
        child: ListView.separated(
          itemCount: schools.length,
          itemBuilder: (context, index) {
            final school = schools[index];
            return SchoolCard(
              school: school,
              showEditButton: school.allowEdit,
              onEdit: () {
                context.pushNamed(
                  Routes.editSchool,
                  params: {
                    'schoolId': school.id.toString(),
                  },
                );
              },
              onTap: () {
                context.pushNamed(
                  Routes.schoolDetail,
                  params: {'schoolId': school.id.toString()},
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
