import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:school_watch_semeru/features/school/presentation/add_school/add_school_controller.dart';
import 'package:school_watch_semeru/features/school/presentation/add_school/widgets/school_data_form.dart';
import 'package:school_watch_semeru/features/school/presentation/add_school/widgets/school_floor_plan_form.dart';

import '../../../../common/constants/constant.dart';
import 'add_school_state.dart';

class AddSchoolScreen extends ConsumerStatefulWidget {
  const AddSchoolScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddSchoolScreen> createState() => _AddSchoolScreenState();
}

class _AddSchoolScreenState extends ConsumerState<AddSchoolScreen> {
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

  _animateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: kDurationShort,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addSchoolControllerProvider);
    final screenWidth = MediaQuery.of(context).size.width - (2 * SWSizes.s16);

    final canGoBack = state.currentPage > 0;

    final forms = [
      FractionallySizedBox(
        widthFactor: 1 / _pageController.viewportFraction,
        child: SchoolDataForm(
          schoolName: state.schoolNameInput.value,
          schoolAddress: state.schoolAddressInput.value,
        ),
      ),
      FractionallySizedBox(
        widthFactor: 1 / _pageController.viewportFraction,
        child: const SchoolFloorPlanForm(),
      ),
    ];

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (canGoBack) {
            _animateToPage(state.currentPage - 1);
            return false;
          }
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(SWStrings.labelAddSchool),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                if (canGoBack) {
                  _animateToPage(state.currentPage - 1);
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
                      width:
                          screenWidth * state.currentPage / (forms.length - 1),
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
                        .read(addSchoolControllerProvider.notifier)
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
      ),
    );
  }

  _buildFormActions(
    BuildContext context,
    AddSchoolState state,
    List<Widget> forms,
  ) {
    var disabled = false;

    if (state.schoolNameInput.isNotValid ||
        state.schoolNameInput.isPure ||
        state.schoolAddressInput.isNotValid ||
        state.schoolAddressInput.isPure) {
      disabled = true;
    }

    return ElevatedButton(
      onPressed: disabled ? null :() {
        final currentPage = state.currentPage;
        if (currentPage < forms.length - 1) {
          _animateToPage(currentPage + 1);
        } else {
          // do submission
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
