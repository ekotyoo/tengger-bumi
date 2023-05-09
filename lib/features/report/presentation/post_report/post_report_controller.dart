import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'post_report_state.dart';
import '../models/image_pick_input.dart';
import '../models/information_text_input.dart';
import '../models/label_text_input.dart';
import '../../../../common/models/position.dart';
import '../models/additional_info_input_wrapper.dart';
import '../models/category_option_input.dart';
import '../models/location_pick_input.dart';
import '../../domain/category.dart';
import '../models/description_text_input.dart';
import 'widgets/pick_report_type_form.dart';
import 'widgets/pick_school_form.dart';

part 'post_report_controller.g.dart';

const kMaxAdditionalInfo = 3;

@riverpod
class PostReportController extends _$PostReportController {
  @override
  FutureOr<PostReportState> build() async {
    return const PostReportState();
  }

      void onPageChange(int page) => state = AsyncValue.data(state.requireValue.copyWith(currentPage: page));

  void onSchoolChange(SchoolOption school) =>
      state = AsyncValue.data(state.requireValue.copyWith(selectedSchool: school));

  void onReportTypeChange(ReportType type) {
    state = AsyncValue.data(state.requireValue.copyWith(selectedReportType: type));
  }

  void onDescriptionChange(String value) =>
      state = AsyncValue.data(state.requireValue.copyWith(
          descriptionInput: DescriptionTextInput.dirty(value: value)));

  void onCategoryChange(Category? value) =>
      state =
          AsyncValue.data(state.requireValue.copyWith(
              categoryInput: CategoryOptionInput.dirty(value: value)));

  void onLocationChange(LatLng? value) {
    if (value == null) return;

    state = AsyncValue.data(state.requireValue.copyWith(
      locationInput: LocationPickInput.dirty(
        value: Position(
          latitude: value.latitude,
          longitude: value.longitude,
        ),
      ),
    ));
  }

  void addAdditionalInfo() {
    if (state.requireValue.additionalInfoInputs.length >= kMaxAdditionalInfo) return;

    final newList = state.requireValue.additionalInfoInputs.isEmpty
        ? <AdditionalInfoInputWrapper>[]
        : state.requireValue.additionalInfoInputs;

    newList.add(AdditionalInfoInputWrapper(
      key: UniqueKey(),
      labelInput: const LabelTextInput.pure(),
      informationInput: const InformationTextInput.pure(),
    ));

    state = AsyncValue.data(state.requireValue.copyWith(additionalInfoInputs: newList));
  }

  void removeAdditionalInfo(int index) {
    debugPrint('Removing item at index: $index');
    final newList = state.requireValue.additionalInfoInputs;
    newList.removeAt(index);

    state = AsyncValue.data(state.requireValue.copyWith(additionalInfoInputs: newList));
  }

  void onLabelChange(int index, String value) {
    final newList = state.requireValue.additionalInfoInputs;
    final newItem = state.requireValue.additionalInfoInputs[index].copyWith(
      labelInput: LabelTextInput.dirty(value: value),
    );

    newList[index] = newItem;

    state = AsyncValue.data(state.requireValue.copyWith(additionalInfoInputs: newList));
  }

  void onInformationChange(int index, String value) {
    final newList = state.requireValue.additionalInfoInputs;
    final newItem = state.requireValue.additionalInfoInputs[index].copyWith(
      informationInput: InformationTextInput.dirty(value: value),
    );

    newList[index] = newItem;

    state = AsyncValue.data(state.requireValue.copyWith(additionalInfoInputs: newList));
  }

  void onImagesSelected(List<XFile> images) {
    state = AsyncValue.data(state.requireValue.copyWith(
      imageInput: ImagePickInput.dirty(value: state.requireValue.imageInput.value + images)),
    );
  }

  void onImageDeleted(XFile image) {
    final newList = state.requireValue.imageInput.value;
    newList.remove(image);

    state = AsyncValue.data(state.requireValue.copyWith(imageInput: ImagePickInput.dirty(value: newList)));
  }

  void onSubmit() {
    state = AsyncValue.data(state.requireValue.copyWith(
      descriptionInput: DescriptionTextInput.dirty(
        value: state.requireValue.descriptionInput.value,
      ),
      categoryInput: CategoryOptionInput.dirty(
        value: state.requireValue.categoryInput.value,
      ),
      locationInput: LocationPickInput.dirty(
        value: state.requireValue.locationInput.value,
      ),
      additionalInfoInputs: state.requireValue.additionalInfoInputs
          .map(
            (e) =>
            AdditionalInfoInputWrapper(
                key: e.key,
                labelInput: LabelTextInput.dirty(value: e.labelInput.value),
                informationInput: InformationTextInput.dirty(
                    value: e.informationInput.value)),
      )
          .toList(),
      imageInput: ImagePickInput.dirty(value: state.requireValue.imageInput.value),
    ));

    Formz.validate([
      state.requireValue.descriptionInput,
      state.requireValue.categoryInput,
      state.requireValue.locationInput,
      ...state.requireValue.additionalInfoInputs.map((e) => e.labelInput).toList(),
      ...state.requireValue.additionalInfoInputs.map((e) => e.informationInput).toList(),
      state.requireValue.imageInput,
    ]);
  }
}

final postReportControllerProvider =
StateNotifierProvider.autoDispose<PostReportController, PostReportState>(
      (ref) => PostReportController(),
);
