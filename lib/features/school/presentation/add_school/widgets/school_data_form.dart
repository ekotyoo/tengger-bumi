import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../add_school_controller.dart';
import '../../../../../common/constants/constant.dart';
import '../../../../../common/widgets/sw_text_field.dart';
import '../../../../../common/widgets/title_with_caption.dart';

class SchoolDataForm extends ConsumerStatefulWidget {
  const SchoolDataForm({
    Key? key,
    this.schoolName,
    this.schoolAddress
  }) : super(key: key);

  final String? schoolName;
  final String? schoolAddress;

  @override
  ConsumerState createState() => _SchoolDataFormState();
}

class _SchoolDataFormState extends ConsumerState<SchoolDataForm> {
  late TextEditingController _nameController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.schoolName ?? '');
    _addressController = TextEditingController(text: widget.schoolAddress ?? '');
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addSchoolControllerProvider);

    return Column(
      children: [
        const TitleWithCaption(
          title: SWStrings.labelSchoolData,
          caption: SWStrings.dummyText,
        ),
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
