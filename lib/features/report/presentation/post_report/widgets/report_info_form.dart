import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/widgets/sw_dropdown.dart';
import '../../models/additional_info_input_wrapper.dart';
import '../../models/location_pick_input.dart';
import '../post_report_controller.dart';
import '../../../../../common/widgets/sw_text_field.dart';
import '../../../../../common/constants/constant.dart';
import '../../../../../common/widgets/loading_image.dart';
import '../../../../../common/widgets/title_with_caption.dart';

class ReportInfoForm extends ConsumerWidget {
  const ReportInfoForm({super.key, this.descriptionController});

  final TextEditingController? descriptionController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const TitleWithCaption(
          title: SWStrings.labelCompleteReport,
          caption: SWStrings.dummyText,
        ),
        const SizedBox(height: SWSizes.s16),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ..._buildFormInputFields(context, ref),
              const Divider(),
              _buildSelectedImageList(context),
              const SizedBox(height: SWSizes.s8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: kColorNeutral80,
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: SWSizes.s8),
                  GestureDetector(
                    child: const Icon(
                      Icons.image,
                      color: kColorNeutral80,
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildFormInputFields(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postReportControllerProvider);

    return [
      SWTextField(
        controller: descriptionController,
        hint: SWStrings.labelDescription,
        maxLines: 5,
        errorText: state.descriptionInput.isPure
            ? null
            : state.descriptionInput.error?.getErrorMessage(),
        action: TextInputAction.done,
        onChanged: (value) => ref
            .read(postReportControllerProvider.notifier)
            .onDescriptionChange(value),
      ),
      const SizedBox(height: SWSizes.s16),
      SWDropdown(
        hint: SWStrings.labelCategory,
        errorText: state.categoryInput.isPure
            ? null
            : state.categoryInput.error?.getErrorMessage(),
        onChanged: (value) => ref
            .read(postReportControllerProvider.notifier)
            .onCategoryChange(value),
        value: state.categoryInput.value,
        items: state.categories
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.label),
                ))
            .toList(),
      ),
      const SizedBox(height: SWSizes.s16),
      _PickLocationButton(locationInput: state.locationInput),
      const Divider(height: SWSizes.s16),
      for (var i = 0; i < state.additionalInfoInputs.length; i++) ...[
        _AdditionalInfoTextField(
          key: state.additionalInfoInputs[i].key,
          input: state.additionalInfoInputs[i],
          onLabelChanged: (value) {
            ref
                .read(postReportControllerProvider.notifier)
                .onLabelChange(i, value);
          },
          onInformationChanged: (value) {
            ref
                .read(postReportControllerProvider.notifier)
                .onInformationChange(i, value);
          },
          onDelete: () => ref
              .read(postReportControllerProvider.notifier)
              .removeAdditionalInfo(i),
        ),
        const SizedBox(height: SWSizes.s8),
      ],
      const SizedBox(height: SWSizes.s8),
      if (state.additionalInfoInputs.length < kMaxAdditionalInfo)
        TextButton(
          onPressed: () => ref
              .read(postReportControllerProvider.notifier)
              .addAdditionalInfo(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(SWStrings.labelAddAdditionalInfo),
              Icon(Icons.add),
            ],
          ),
        ),
    ];
  }

  _buildSelectedImageList(BuildContext context) {
    return SizedBox(
      height: SWSizes.s80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Stack(
          children: [
            SizedBox(
              height: SWSizes.s80,
              width: SWSizes.s80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SWSizes.s8),
                child: const LoadingImage(
                  url: 'https://picsum.photos/80/80',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: SWSizes.s4,
              right: SWSizes.s4,
              child: GestureDetector(
                onTap: () {},
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
        ),
        separatorBuilder: (context, index) => const SizedBox(width: SWSizes.s8),
        itemCount: 3,
      ),
    );
  }
}

class _AdditionalInfoTextField extends StatefulWidget {
  const _AdditionalInfoTextField({
    Key? key,
    required this.input,
    this.onDelete,
    this.onLabelChanged,
    this.onInformationChanged,
  }) : super(key: key);

  final AdditionalInfoInputWrapper input;
  final VoidCallback? onDelete;
  final Function(String)? onLabelChanged;
  final Function(String)? onInformationChanged;

  @override
  State<_AdditionalInfoTextField> createState() => _AdditionalInfoTextFieldState();
}

class _AdditionalInfoTextFieldState extends State<_AdditionalInfoTextField> {
  late TextEditingController _labelController;
  late TextEditingController _informationController;

  @override
  void initState() {
    _labelController = TextEditingController(text: widget.input.labelInput.value);
    _informationController = TextEditingController(text: widget.input.informationInput.value);
    super.initState();
  }

  @override
  void dispose() {
    _labelController.dispose();
    _informationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SWTextField(
            controller: _labelController,
            hint: SWStrings.labelLabel,
            onChanged: widget.onLabelChanged,
            errorText: widget.input.labelInput.isPure
                ? null
                : widget.input.labelInput.error?.getErrorMessage(),
          ),
        ),
        const SizedBox(width: SWSizes.s16),
        Expanded(
          child: SWTextField(
            controller: _informationController,
            hint: SWStrings.labelInformation,
            onChanged: widget.onInformationChanged,
            errorText: widget.input.informationInput.isPure
                ? null
                : widget.input.informationInput.error?.getErrorMessage(),
          ),
        ),
        const SizedBox(width: SWSizes.s8),
        Padding(
          padding: const EdgeInsets.only(top: 28 - (24 / 2)),
          child: GestureDetector(
            onTap: widget.onDelete,
            child: const Icon(
              Icons.close,
              color: kColorNeutral100,
            ),
          ),
        ),
      ],
    );
  }
}

class _PickLocationButton extends StatelessWidget {
  const _PickLocationButton({Key? key, required this.locationInput})
      : super(key: key);

  final LocationPickInput locationInput;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(kColorNeutral100),
              backgroundColor: MaterialStateProperty.all(kColorPrimary50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                locationInput.value?.toString() ?? SWStrings.labelLocation,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Icon(Icons.pin_drop_outlined),
            ],
          ),
        ),
        if (!locationInput.isPure && locationInput.error?.getErrorMessage() != null) ...[
          const SizedBox(height: SWSizes.s4),
          Text(
            locationInput.error!.getErrorMessage(),
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
