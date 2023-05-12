import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/sw_button.dart';
import '../../../../utils/snackbar_utils.dart';
import 'add_school_controller.dart';
import 'widgets/school_data_form.dart';
import 'widgets/school_floor_plan_form.dart';
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

    ref.listen(
      addSchoolControllerProvider.select((value) => value.errorMessage),
          (previous, next) {
        if (next != null && context.mounted) {
          showSnackbar(context, message: next, type: SnackbarType.error);
        }
        ref.read(addSchoolControllerProvider.notifier).setErrorMessage(null);
      },
    );

    ref.listen(
      addSchoolControllerProvider.select((value) => value.successMessage),
          (previous, next) {
        if (next != null && context.mounted) {
          showSnackbar(context, message: next);
          context.pop();
        }
        ref.read(addSchoolControllerProvider.notifier).setSuccessMessage(null);
      },
    );

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
          resizeToAvoidBottomInset: false,
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

    if ((state.schoolNameInput.isNotValid || state.schoolAddressInput.isNotValid) &&
        state.currentPage == 0) {
      disabled = true;
    } else if ((state.floorPlan?.rooms.isEmpty ?? false) &&
        state.currentPage == 1) {
      disabled = true;
    }

    return SWButton(
      loading: state.finalFormSubmitting,
      label: state.currentPage < forms.length - 1
          ? SWStrings.labelNext
          : SWStrings.labelSave,
      onPressed: disabled
          ? null
          : () {
        final currentPage = state.currentPage;
        if (currentPage < forms.length - 1) {
          _animateToPage(currentPage + 1);
        } else {
          ref.read(addSchoolControllerProvider.notifier).onSubmit();
        }
      },
    );
  }
}
