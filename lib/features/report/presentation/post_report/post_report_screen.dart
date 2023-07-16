import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tetenger_bumi/features/report/presentation/post_report/widgets/planting_area_form.dart';

import '../../../../common/widgets/sw_button.dart';
import '../../../../utils/snackbar_utils.dart';
import 'post_report_state.dart';
import '../../../../common/constants/constant.dart';
import 'widgets/report_info_form.dart';
import 'post_report_controller.dart';

enum FormType { post, edit }

class PostReportScreen extends ConsumerStatefulWidget {
  const PostReportScreen(
      {super.key, this.formType = FormType.post, this.reportId});

  final FormType formType;
  final int? reportId;

  @override
  ConsumerState<PostReportScreen> createState() => _PostReportScreenState();
}

class _PostReportScreenState extends ConsumerState<PostReportScreen> {
  late PageController _pageController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.1, initialPage: 0);
    _descriptionController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => ref
          .read(postReportControllerProvider(widget.formType).notifier)
          .initForm(widget.reportId),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postReportControllerProvider(widget.formType));

    ref.listen(
      postReportControllerProvider(widget.formType)
          .select((value) => value.errorMessage),
      (previous, next) {
        if (next != null && context.mounted) {
          showSnackbar(context, message: next, type: SnackbarType.error);
          ref
              .read(postReportControllerProvider(widget.formType).notifier)
              .setErrorMessage(null);
        }
      },
    );

    ref.listen(
      postReportControllerProvider(widget.formType)
          .select((value) => value.successMessage),
      (previous, next) {
        if (next != null && context.mounted) {
          showSnackbar(context, message: next);
          ref
              .read(postReportControllerProvider(widget.formType).notifier)
              .setSuccessMessage(null);
          context.pop();
        }
      },
    );

    final screenWidth = MediaQuery.of(context).size.width - (2 * SWSizes.s16);

    final canGoBack = state.currentPage > 0;

    final forms = [
      FractionallySizedBox(
        widthFactor: 1 / _pageController.viewportFraction,
        child: ReportInfoForm(
          descriptionController: _descriptionController,
          formType: widget.formType,
        ),
      ),
      FractionallySizedBox(
        widthFactor: 1 / _pageController.viewportFraction,
        child: PlantingAreaForm(formType: widget.formType),
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
            title: Text(widget.formType == FormType.edit
                ? SWStrings.labelEditPost
                : SWStrings.labelPostReport),
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
                        .read(postReportControllerProvider(widget.formType)
                            .notifier)
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

  _animateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: kDurationShort,
      curve: Curves.easeInOut,
    );
  }

  _buildFormActions(
    BuildContext context,
    PostReportState state,
    List<Widget> forms,
  ) {
    var disabled = false;

    if  (state.currentPage == 0) {
      var firstPageDisabled =
          state.imageInput.isNotValid ||
          state.categoryInput.isNotValid ||
          state.nameInput.isNotValid ||
          state.plantingCountInput.isNotValid ||
          state.descriptionInput.isNotValid ||
          state.plantingDateInput.isNotValid;
      disabled = firstPageDisabled;
    }
    return SWButton(
      loading: state.finalFormSubmitting,
      disabled: disabled,
      label: state.currentPage < forms.length - 1
          ? SWStrings.labelNext
          : SWStrings.labelSave,
      onPressed: () {
        final currentPage = state.currentPage;
        if (currentPage < forms.length - 1) {
          _animateToPage(currentPage + 1);
        } else {
          ref
              .read(postReportControllerProvider(widget.formType).notifier)
              .onSubmit();
        }
      },
    );
  }
}
