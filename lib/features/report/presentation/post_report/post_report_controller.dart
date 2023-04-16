import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../models/information_text_input.dart';
import '../models/label_text_input.dart';
import '../../domain/latlng.dart';
import '../models/additional_info_input_wrapper.dart';
import '../models/category_option_input.dart';
import '../models/location_pick_input.dart';
import '../../domain/category.dart';
import '../models/description_text_input.dart';
import 'widgets/pick_report_type_form.dart';
import 'widgets/pick_school_form.dart';

part './post_report_state.dart';

const kMaxAdditionalInfo = 3;

class PostReportController extends StateNotifier<PostReportState> {
  PostReportController()
      : super(PostReportState(
          categories: List.generate(
            5,
            (index) => Category(
              id: index.toString(),
              label: 'Kategori-${index + 1}',
            ),
          ),
        ));

  void onPageChange(int page) => state = state.copyWith(currentPage: page);

  void onSchoolChange(SchoolOption school) =>
      state = state.copyWith(selectedSchool: school);

  void onReportTypeChange(ReportType type) {
    state = state.copyWith(selectedReportType: type);
  }

  void onDescriptionChange(String value) => state = state.copyWith(
      descriptionInput: DescriptionTextInput.dirty(value: value));

  void onCategoryChange(Category? value) => state =
      state.copyWith(categoryInput: CategoryOptionInput.dirty(value: value));

  void onLocationChange(LatLng? value) => state =
      state.copyWith(locationInput: LocationPickInput.dirty(value: value));

  void addAdditionalInfo() {
    if (state.additionalInfoInputs.length >= kMaxAdditionalInfo) return;

    final newList = state.additionalInfoInputs.isEmpty
        ? <AdditionalInfoInputWrapper>[]
        : state.additionalInfoInputs;

    newList.add(AdditionalInfoInputWrapper(
      key: UniqueKey(),
      labelInput: const LabelTextInput.pure(),
      informationInput: const InformationTextInput.pure(),
    ));

    state = state.copyWith(additionalInfoInputs: newList);
  }

  void removeAdditionalInfo(int index) {
    debugPrint('Removing item at index: $index');
    final newList = state.additionalInfoInputs;
    newList.removeAt(index);

    state = state.copyWith(additionalInfoInputs: newList);
  }

  void onLabelChange(int index, String value) {
    final newList = state.additionalInfoInputs;
    final newItem = state.additionalInfoInputs[index].copyWith(
      labelInput: LabelTextInput.dirty(value: value),
    );

    newList[index] = newItem;

    state = state.copyWith(additionalInfoInputs: newList);
  }

  void onInformationChange(int index, String value) {
    final newList = state.additionalInfoInputs;
    final newItem = state.additionalInfoInputs[index].copyWith(
      informationInput: InformationTextInput.dirty(value: value),
    );

    newList[index] = newItem;

    state = state.copyWith(additionalInfoInputs: newList);
  }

  void onSubmit() {
    state = state.copyWith(
      descriptionInput: DescriptionTextInput.dirty(
        value: state.descriptionInput.value,
      ),
      categoryInput: CategoryOptionInput.dirty(
        value: state.categoryInput.value,
      ),
      locationInput: LocationPickInput.dirty(
        value: state.locationInput.value,
      ),
      additionalInfoInputs: state.additionalInfoInputs
          .map(
            (e) => AdditionalInfoInputWrapper(
                key: e.key,
                labelInput: LabelTextInput.dirty(value: e.labelInput.value),
                informationInput: InformationTextInput.dirty(
                    value: e.informationInput.value)),
          )
          .toList(),
    );

    Formz.validate([
      state.descriptionInput,
      state.categoryInput,
      state.locationInput,
      ...state.additionalInfoInputs.map((e) => e.labelInput).toList(),
      ...state.additionalInfoInputs.map((e) => e.informationInput).toList(),
    ]);
  }
}

final postReportControllerProvider =
    StateNotifierProvider.autoDispose<PostReportController, PostReportState>(
  (ref) => PostReportController(),
);
