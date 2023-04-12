import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constants/constant.dart';
import './widgets/pick_report_type_form.dart';
import './widgets/pick_school_form.dart';
import './widgets/report_info_form.dart';
import 'post_report_form_notifier.dart';

final dummySchools = List.generate(
  10,
  (index) => SchoolOption(
    id: index.toString(),
    name: 'SD Negeri ${index + 1} Sidomulyo',
  ),
);

const reportTypes = [
  ReportType(
    name: 'Pencegahan',
    description: SWStrings.dummyText,
    color: kColorSuccess75,
  ),
  ReportType(
    name: 'Eksisting',
    description: SWStrings.dummyText,
    color: kColorSecondary75,
  ),
  ReportType(
    name: 'Dampak',
    description: SWStrings.dummyText,
    color: kColorPrimary75,
  ),
];

class PostReportScreen extends ConsumerStatefulWidget {
  const PostReportScreen({super.key});

  @override
  ConsumerState<PostReportScreen> createState() => _PostReportScreenState();
}

class _PostReportScreenState extends ConsumerState<PostReportScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.1, initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postReportFormNotifierProvider);
    final screenWidth = MediaQuery.of(context).size.width - (2 * SWSizes.s16);

    final canGoBack = state.currentPage > 0;

    final forms = [
      FractionallySizedBox(
        widthFactor: 1 / _pageController.viewportFraction,
        child: PickSchoolForm(
          schools: dummySchools,
          selectedSchool: state.selectedSchool,
          onSchoolSelected: (school) => ref
              .read(postReportFormNotifierProvider.notifier)
              .onSchoolSelected(school),
        ),
      ),
      FractionallySizedBox(
        widthFactor: 1 / _pageController.viewportFraction,
        child: PickReportTypeForm(
          types: reportTypes,
          selectedType: state.selectedReportType,
          onTypeSelected: (type) => ref
              .read(postReportFormNotifierProvider.notifier)
              .onReportTypeSelected(type),
        ),
      ),
      FractionallySizedBox(
        widthFactor: 1 / _pageController.viewportFraction,
        child: const ReportInfoForm(),
      ),
    ];

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(SWStrings.labelPostReport),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (canGoBack) {
                _pageController.animateToPage(
                  state.currentPage - 1,
                  duration: kDurationShort,
                  curve: Curves.easeInOut,
                );
              } else {
                context.pop();
              }
            },
            icon: Icon(canGoBack ? Icons.arrow_back : Icons.close_rounded),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(SWSizes.s16),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    color: kColorPrimary50,
                    width: screenWidth,
                    height: SWSizes.s4,
                  ),
                  AnimatedContainer(
                    duration: kDurationShort,
                    color: kColorPrimary500,
                    width: screenWidth * state.currentPage / (forms.length - 1),
                    height: SWSizes.s4,
                  ),
                ],
              ),
              const SizedBox(height: SWSizes.s16),
              Expanded(
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: (value) => ref
                      .read(postReportFormNotifierProvider.notifier)
                      .onPageChange(value),
                  physics: const NeverScrollableScrollPhysics(),
                  children: forms,
                ),
              ),
              const SizedBox(height: SWSizes.s16),
              _buildFormActions(context, state, forms),
              const SizedBox(height: SWSizes.s32)
            ],
          ),
        ),
      ),
    );
  }

  _animateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: kDurationShort,
      curve: Curves.easeInOut,
    );
  }

  _buildFormActions(
    BuildContext context,
    PostReportFormState state,
    List<Widget> forms,
  ) {
    var disabled = false;

    if (state.currentPage == 0 && state.selectedSchool == null) {
      disabled = true;
    } else if (state.currentPage == 1 && state.selectedReportType == null) {
      disabled = true;
    }

    return ElevatedButton(
      onPressed: disabled
          ? null
          : () {
              final currentPage = state.currentPage;
              if (currentPage < forms.length - 1) {
                _animateToPage(currentPage + 1);
              } else {
                // TODO: Handle form submission
                context.pop();
              }
            },
      child: Text(
        state.currentPage < forms.length - 1
            ? SWStrings.labelNext
            : SWStrings.labelSave,
      ),
    );
  }
}
