import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../extensions/latlng_extenstion.dart';
import '../../../../../common/routing/routes.dart';
import '../../../../../common/widgets/sw_dropdown.dart';
import '../../models/location_pick_input.dart';
import '../post_report_controller.dart';
import '../../../../../common/constants/constant.dart';
import '../../../../../common/widgets/title_with_caption.dart';
import '../post_report_screen.dart';
import '../post_report_state.dart';

class PlantingAreaForm extends ConsumerStatefulWidget {
  const PlantingAreaForm({super.key, this.formType = FormType.post});

  final FormType formType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlantingAreaFormState();
}

class _PlantingAreaFormState extends ConsumerState<PlantingAreaForm> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postReportControllerProvider(widget.formType));
    const loadingWidget = Center(child: CircularProgressIndicator());

    return Column(
      children: [
        const TitleWithCaption(
          title: 'Area Tanam',
          caption:
              'Silahkan lengkapi informasi dibawah untuk mengunggah laporan.',
        ),
        const SizedBox(height: SWSizes.s16),
        Expanded(
          child: state.infoFormLoading
              ? loadingWidget
              : ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
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
        hint: SWStrings.labelProvinces,
        errorText: state.provinceInput.isPure
            ? null
            : state.provinceInput.error?.getErrorMessage(),
        onChanged: (value) => ref
            .read(postReportControllerProvider(widget.formType).notifier)
            .onProvinceChange(value),
        value: state.provinceInput.value,
        items: state.provinces
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e.name),
              ),
            )
            .toList(),
      ),
      const SizedBox(height: SWSizes.s16),
      SWDropdown(
        hint: SWStrings.labelCities,
        errorText: state.regencyInput.isPure
            ? null
            : state.regencyInput.error?.getErrorMessage(),
        onChanged: (value) => ref
              .read(postReportControllerProvider(widget.formType).notifier)
              .onRegencyChange(value),
        value: state.regencyInput.value,
        items: state.regencies
            .map(
              (e) => DropdownMenuItem(
            value: e,
            child: Text(e.name),
          ),
        )
            .toList(),
      ),
      const SizedBox(height: SWSizes.s16),
      SWDropdown(
        hint: SWStrings.labelDistricts,
        errorText: state.districtInput.isPure
            ? null
            : state.districtInput.error?.getErrorMessage(),
        onChanged: (value) => ref
            .read(postReportControllerProvider(widget.formType).notifier)
            .onDistrictChange(value),
        value: state.districtInput.value,
        items: state.districts
            .map(
              (e) => DropdownMenuItem(
            value: e,
            child: Text(e.name),
          ),
        )
            .toList(),
      ),
      const SizedBox(height: SWSizes.s16),
      SWDropdown(
        hint: SWStrings.labelVillages,
        errorText: state.villageInput.isPure
            ? null
            : state.villageInput.error?.getErrorMessage(),
        onChanged: (value) => ref
            .read(postReportControllerProvider(widget.formType).notifier)
            .onVillageChange(value),
        value: state.villageInput.value,
        items: state.villages
            .map(
              (e) => DropdownMenuItem(
            value: e,
            child: Text(e.name),
          ),
        )
            .toList(),
      ),
      const Divider(),
      _PickLocationButton(
        locationInput: state.locationInput,
        onTap: () async {
          final selectedLocation = state.locationInput.value?.toLatLng();

          final result = await context.pushNamed(Routes.locationPicker,
              extra: selectedLocation) as Map<String, dynamic>?;
          final position = result?['position'];

          ref
              .read(postReportControllerProvider(widget.formType).notifier)
              .onLocationChange(position);
        },
      ),
    ];
  }
}

class _PickLocationButton extends StatelessWidget {
  const _PickLocationButton({Key? key, required this.locationInput, this.onTap})
      : super(key: key);

  final LocationPickInput locationInput;
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
                locationInput.value == null
                    ? SWStrings.labelLocation
                    : '${locationInput.value?.latitude}, ${locationInput.value?.longitude}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Icon(Icons.pin_drop_outlined),
            ],
          ),
        ),
        if (!locationInput.isPure &&
            locationInput.error?.getErrorMessage() != null) ...[
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
