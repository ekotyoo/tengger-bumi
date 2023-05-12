import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../add_school_controller.dart';
import '../../../../../common/constants/constant.dart';
import '../../../../../common/widgets/sw_text_field.dart';
import '../../../../../common/widgets/title_with_caption.dart';

class SchoolDataForm extends ConsumerStatefulWidget {
  const SchoolDataForm({Key? key, this.schoolName, this.schoolAddress})
      : super(key: key);

  final String? schoolName;
  final String? schoolAddress;

  @override
  ConsumerState createState() => _SchoolDataFormState();
}

class _SchoolDataFormState extends ConsumerState<SchoolDataForm> {
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _nameController = TextEditingController(text: widget.schoolName ?? '');
    _addressController =
        TextEditingController(text: widget.schoolAddress ?? '');
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _addressController.dispose();
  }

  void _pickImageFromGallery(WidgetRef ref) async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 600,
        maxHeight: 600,
        imageQuality: 70,
      );
      if (image != null) {
        ref
            .read(addSchoolControllerProvider.notifier)
            .onCoverImageChanged(image);
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
        maxWidth: 600,
        maxHeight: 600,
        imageQuality: 70,
      );
      if (image != null) {
        ref
            .read(addSchoolControllerProvider.notifier)
            .onCoverImageChanged(image);
      }
      if (context.mounted) context.pop();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Widget _buildSelectedImage(File image) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(SWSizes.s8),
          child: SizedBox(
            height: 100,
            width: double.infinity,
            child: Image.file(image, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: SWSizes.s4,
          right: SWSizes.s4,
          child: GestureDetector(
            onTap: () => ref
                .read(addSchoolControllerProvider.notifier)
                .onCoverImageChanged(null),
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
    final state = ref.watch(addSchoolControllerProvider);

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
          height: 100,
          child: Center(
            child: Text(
              'Belum ada gambar cover',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: kColorNeutral200),
            ),
          ),
        ),
      ),
    );

    return Column(
      children: [
        const TitleWithCaption(
          title: SWStrings.labelSchoolData,
          caption: SWStrings.dummyText,
        ),
        const SizedBox(height: SWSizes.s16),
        state.coverImage != null
            ? _buildSelectedImage(File(state.coverImage!.path))
            : emptyImagePlaceholder,
        const SizedBox(height: SWSizes.s16),
        SWTextField(
          controller: _nameController,
          hint: SWStrings.labelSchoolName,
          maxLines: 1,
          errorText: state.schoolNameInput.isPure
              ? null
              : state.schoolNameInput.error?.getErrorMessage(),
          action: TextInputAction.next,
          onChanged: (value) => ref
              .read(addSchoolControllerProvider.notifier)
              .onSchoolNameChange(value),
        ),
        const SizedBox(height: SWSizes.s16),
        SWTextField(
          controller: _addressController,
          hint: SWStrings.labelSchoolAddress,
          maxLines: 1,
          errorText: state.schoolAddressInput.isPure
              ? null
              : state.schoolAddressInput.error?.getErrorMessage(),
          action: TextInputAction.done,
          onChanged: (value) => ref
              .read(addSchoolControllerProvider.notifier)
              .onSchoolAddressChange(value),
        ),
      ],
    );
  }
}
