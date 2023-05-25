import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/widgets/sw_button.dart';
import 'edit_school_controller.dart';
import '../../../../../common/constants/constant.dart';
import '../../../../../common/widgets/sw_text_field.dart';
import '../../../../../common/widgets/title_with_caption.dart';
import '../../../../utils/snackbar_utils.dart';

class EditSchoolScreen extends ConsumerStatefulWidget {
  const EditSchoolScreen({Key? key, required this.schoolId}) : super(key: key);

  final int schoolId;

  @override
  ConsumerState createState() => _EditSchoolScreenState();
}

class _EditSchoolScreenState extends ConsumerState<EditSchoolScreen> {
  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  void _pickImageFromGallery(WidgetRef ref) async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080,
        maxHeight: 1920,
        imageQuality: 80,
      );
      if (image != null) {
        ref
            .read(editSchoolControllerProvider(widget.schoolId).notifier)
            .onImageSelected(image);
      }
      if (context.mounted) context.pop();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _pickImageFromCamera(WidgetRef ref) async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1080,
        maxHeight: 1920,
        imageQuality: 80,
      );
      if (image != null) {
        ref
            .read(editSchoolControllerProvider(widget.schoolId).notifier)
            .onImageSelected(image);
      }
      if (context.mounted) context.pop();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Widget _buildSelectedImage(String? cover, XFile? newCover) {
    Widget? image;
    if (newCover != null) {
      image = Image.file(File(newCover.path), fit: BoxFit.cover);
    }

    if (cover != null) {
      image = Image.network(cover, fit: BoxFit.cover);
    }

    final emptyImagePlaceholder = GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SWSizes.s32),
              topRight: Radius.circular(SWSizes.s32),
            ),
          ),
          builder: (context) {
            return Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(SWSizes.s16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleWithCaption(title: 'Gambar Cover'),
                      const SizedBox(height: SWSizes.s16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => _pickImageFromCamera(ref),
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              color: kColorNeutral50,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: SWSizes.s16),
                            height: SWSizes.s32,
                            width: SWSizes.s2,
                            color: kColorNeutral50,
                          ),
                          IconButton(
                            onPressed: () => _pickImageFromGallery(ref),
                            icon: const Icon(
                              Icons.image,
                              color: kColorNeutral50,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(SWSizes.s8),
        dashPattern: const [5, 4],
        strokeWidth: 1.5,
        strokeCap: StrokeCap.round,
        color: kColorNeutral200,
        child: SizedBox(
          height: 200,
          child: Center(
            child: Text(
              'Belum ada gambar cover terpilih',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: kColorNeutral200),
            ),
          ),
        ),
      ),
    );

    return cover == null && newCover == null
        ? emptyImagePlaceholder
        : Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(SWSizes.s8),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: image,
                ),
              ),
              Positioned(
                top: SWSizes.s4,
                right: SWSizes.s4,
                child: GestureDetector(
                  onTap: () {
                    ref
                        .read(editSchoolControllerProvider(widget.schoolId)
                            .notifier)
                        .onDeleteImage();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(SWSizes.s2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SWSizes.s8),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: const Icon(
                      Icons.delete_outlined,
                      size: 18,
                    ),
                  ),
                ),
              )
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    final stateAsync = ref.watch(editSchoolControllerProvider(widget.schoolId));

    ref.listen(
      editSchoolControllerProvider(widget.schoolId).selectAsync(
            (data) => data.errorMessage,
      ),
          (previous, next) async {
        final errorMessage = await next;
        if (errorMessage != null && context.mounted) {
          showSnackbar(context,
              message: errorMessage, type: SnackbarType.error);
          ref
              .read(editSchoolControllerProvider(widget.schoolId).notifier)
              .setErrorMessage(null);
        }
      },
    );

    ref.listen(
      editSchoolControllerProvider(widget.schoolId).selectAsync(
            (data) => data.successMessage,
      ),
          (previous, next) async {
        final successMessage = await next;
        if (successMessage != null && context.mounted) {
          showSnackbar(context, message: successMessage);
          context.pop();
          ref
              .read(editSchoolControllerProvider(widget.schoolId).notifier)
              .setErrorMessage(null);
        }
      },
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(SWStrings.labelEditSchool),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.close),
          ),
        ),
        body: stateAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          data: (state) => Padding(
              padding: const EdgeInsets.all(SWSizes.s16),
              child: Column(
                children: [
                  _buildSelectedImage(state.cover, state.newCover),
                  const SizedBox(height: SWSizes.s16),
                  SWTextField(
                    hint: SWStrings.labelSchoolName,
                    maxLines: 1,
                    initialText: state.school.name,
                    errorText: state.schoolNameInput.isPure
                        ? null
                        : state.schoolNameInput.error?.getErrorMessage(),
                    action: TextInputAction.next,
                    onChanged: (value) {
                      ref
                          .read(editSchoolControllerProvider(widget.schoolId)
                              .notifier)
                          .onSchoolNameChange(value);
                    },
                  ),
                  const SizedBox(height: SWSizes.s16),
                  SWTextField(
                    hint: SWStrings.labelSchoolAddress,
                    maxLines: 1,
                    initialText: state.school.address,
                    errorText: state.schoolAddressInput.isPure
                        ? null
                        : state.schoolAddressInput.error?.getErrorMessage(),
                    action: TextInputAction.done,
                    onChanged: (value) {
                      ref
                          .read(editSchoolControllerProvider(widget.schoolId)
                              .notifier)
                          .onSchoolAddressChange(value);
                    },
                  ),
                  const Spacer(),
                  SWButton(
                    label: SWStrings.labelSave,
                    disabled: !state.validated,
                    loading: state.submitting,
                    onPressed: () => ref
                        .read(editSchoolControllerProvider(widget.schoolId)
                            .notifier)
                        .onSubmit(),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
