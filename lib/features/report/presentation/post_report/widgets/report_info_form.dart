import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:image_picker/image_picker.dart';
import 'package:tetenger_bumi/features/report/presentation/models/date_input.dart';

import '../../../../../common/widgets/sw_dropdown.dart';
import '../post_report_controller.dart';
import '../../../../../common/widgets/sw_text_field.dart';
import '../../../../../common/constants/constant.dart';
import '../../../../../common/widgets/title_with_caption.dart';
import '../post_report_screen.dart';
import '../post_report_state.dart';

class ReportInfoForm extends ConsumerStatefulWidget {
  const ReportInfoForm(
      {super.key, this.descriptionController, this.formType = FormType.post});

  final TextEditingController? descriptionController;
  final FormType formType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportInfoFormState();
}

class _ReportInfoFormState extends ConsumerState<ReportInfoForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postReportControllerProvider(widget.formType));
    const loadingWidget = Center(child: CircularProgressIndicator());

    return Column(
      children: [
        const TitleWithCaption(
          title: SWStrings.labelCompleteReport,
          caption:
              'Silahkan lengkapi informasi dibawah untuk mengunggah postingan.',
        ),
        const SizedBox(height: SWSizes.s16),
        Expanded(
          child: state.infoFormLoading
              ? loadingWidget
              : ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ImagePickerInput(
                      images: state.imageInput.value,
                      onImageFromGalleryPicked: (images) {
                        ref
                            .read(postReportControllerProvider(widget.formType)
                                .notifier)
                            .onImagesSelected(images);
                      },
                      onImageFroCameraPicked: (image) {
                        ref
                            .read(postReportControllerProvider(widget.formType)
                                .notifier)
                            .onImagesSelected([image]);
                      },
                      onImageDeleted: (image) {
                        ref
                            .read(postReportControllerProvider(widget.formType)
                                .notifier)
                            .onImageDeleted(image);
                      },
                      errorText: state.imageInput.isPure
                          ? null
                          : state.imageInput.error?.getErrorMessage(),
                    ),
                    const Divider(),
                    ..._buildFormInputFields(context, state),
                  ],
                ),
        ),
      ],
    );
  }

  _buildFormInputFields(BuildContext context, PostReportState state) {
    return [
      SWDropdown(
        hint: SWStrings.labelCategory,
        errorText: state.categoryInput.isPure
            ? null
            : state.categoryInput.error?.getErrorMessage(),
        onChanged: (value) => ref
            .read(postReportControllerProvider(widget.formType).notifier)
            .onCategoryChange(value),
        value: state.categoryInput.value,
        items: state.categories
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.name),
                ))
            .toList(),
      ),
      const SizedBox(height: SWSizes.s16),
      SWTextField(
        initialText: state.nameInput.value,
        hint: SWStrings.labelPlantName,
        maxLines: 1,
        errorText: state.nameInput.isPure
            ? null
            : state.nameInput.error?.getErrorMessage(),
        action: TextInputAction.done,
        onChanged: (value) {
          ref
              .read(postReportControllerProvider(widget.formType).notifier)
              .onNameChange(value);
        },
      ),
      const SizedBox(height: SWSizes.s16),
      SWTextField(
        hint: SWStrings.labelQuantity,
        initialText: state.plantingCountInput.value.toString(),
        maxLines: 1,
        type: SWTextFieldType.number,
        errorText: state.plantingCountInput.isPure
            ? null
            : state.plantingCountInput.error?.getErrorMessage(),
        action: TextInputAction.done,
        onChanged: (value) {
          try {
            final count = int.parse(value);
            ref
                .read(postReportControllerProvider(widget.formType).notifier)
                .onPlantingCountChange(count);
          } catch(e) {
            debugPrint(e.toString());
          }
        },
      ),
      const SizedBox(height: SWSizes.s16),
      SWTextField(
        initialText: state.descriptionInput.value,
        hint: SWStrings.labelDescription,
        maxLines: 5,
        errorText: state.descriptionInput.isPure
            ? null
            : state.descriptionInput.error?.getErrorMessage(),
        action: TextInputAction.done,
        onChanged: (value) => ref
            .read(postReportControllerProvider(widget.formType).notifier)
            .onDescriptionChange(value),
      ),
      const SizedBox(height: SWSizes.s16),
      _PickDateButton(
        dateInput: state.plantingDateInput,
        onTap: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1800),
            lastDate: DateTime(2050),
          );
          ref
              .read(postReportControllerProvider(widget.formType).notifier)
              .onPlantingDateChange(date);
        },
      ),
    ];
  }
}

class _PickDateButton extends StatelessWidget {
  const _PickDateButton({Key? key, required this.dateInput, this.onTap})
      : super(key: key);

  final DateInput dateInput;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(kColorNeutral100),
              backgroundColor: MaterialStateProperty.all(kColorPrimary50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dateInput.value == null
                    ? SWStrings.labelPlantingDate
                    : '${dateInput.value}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Icon(Icons.calendar_month),
            ],
          ),
        ),
        if (!dateInput.isPure &&
            dateInput.error?.getErrorMessage() != null) ...[
          const SizedBox(height: SWSizes.s4),
          Text(
            dateInput.error!.getErrorMessage(),
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Theme.of(context).colorScheme.error),
          ),
          const SizedBox(height: SWSizes.s4),
        ]
      ],
    );
  }
}

class ImagePickerInput extends ConsumerWidget {
  ImagePickerInput({
    Key? key,
    this.errorText,
    this.onImageFromGalleryPicked,
    this.onImageFroCameraPicked,
    this.onImageDeleted,
    this.images = const [],
  }) : super(key: key);

  final _imagePicker = ImagePicker();
  final String? errorText;
  final Function(List<XFile>)? onImageFromGalleryPicked;
  final Function(XFile)? onImageFroCameraPicked;
  final Function(fp.Either<XFile, String>)? onImageDeleted;
  final List<fp.Either<XFile, String>> images;

  void _pickImageFromGallery(WidgetRef ref) async {
    try {
      final images = await _imagePicker.pickMultiImage(
        maxWidth: 1080,
        maxHeight: 1920,
        imageQuality: 80,
      );
      onImageFromGalleryPicked?.call(images);
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
        onImageFroCameraPicked?.call(image);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _buildImageList(List<fp.Either<XFile, String>> images, WidgetRef ref) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => ImageCard(
        src: images[index],
        onDelete: () => onImageDeleted?.call(images[index]),
      ),
      separatorBuilder: (context, index) => const SizedBox(width: SWSizes.s8),
      itemCount: images.length,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emptyImagePlaceholder = DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(SWSizes.s8),
      dashPattern: const [5, 4],
      strokeWidth: 1.5,
      strokeCap: StrokeCap.round,
      color: kColorNeutral200,
      child: SizedBox(
        height: SWSizes.s80,
        child: Center(
          child: Text(
            SWStrings.descNoImagePicked,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: kColorNeutral200),
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SWSizes.s80,
          child: images.isNotEmpty
              ? _buildImageList(images, ref)
              : emptyImagePlaceholder,
        ),
        const SizedBox(height: SWSizes.s8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _pickImageFromCamera(ref),
              child: const Icon(
                Icons.camera_alt_outlined,
                color: kColorNeutral80,
              ),
            ),
            const SizedBox(width: SWSizes.s8),
            GestureDetector(
              onTap: () => _pickImageFromGallery(ref),
              child: const Icon(
                Icons.image,
                color: kColorNeutral80,
              ),
            )
          ],
        ),
        if (errorText != null) ...[
          const SizedBox(height: SWSizes.s4),
          Text(
            errorText!,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Theme.of(context).colorScheme.error),
          ),
          const SizedBox(height: SWSizes.s4),
        ]
      ],
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.src, this.onDelete})
      : super(key: key);

  final fp.Either<XFile, String> src;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: SWSizes.s80,
          width: SWSizes.s80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(SWSizes.s8),
            child: src.fold(
              (l) => Image.file(
                key: ValueKey(src),
                File(l.path),
                fit: BoxFit.cover,
              ),
              (r) => Image.network(
                r,
                key: ValueKey(r),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: SWSizes.s4,
          right: SWSizes.s4,
          child: GestureDetector(
            onTap: onDelete,
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
}
