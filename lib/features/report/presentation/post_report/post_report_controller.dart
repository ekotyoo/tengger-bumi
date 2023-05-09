import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

import '../../../../common/constants/constant.dart';
import '../../data/i_report_repository.dart';
import '../../data/report_repository.dart';
import '../../domain/report_request.dart';
import '../../../../common/models/position.dart';
import '../models/image_pick_input.dart';
import '../models/information_text_input.dart';
import '../models/label_text_input.dart';
import '../models/additional_info_input_wrapper.dart';
import '../models/category_option_input.dart';
import '../models/location_pick_input.dart';
import '../../domain/category.dart';
import '../models/description_text_input.dart';
import 'post_report_state.dart';
import 'widgets/pick_report_type_form.dart';
import 'widgets/pick_school_form.dart';

const kMaxAdditionalInfo = 3;

class PostReportController extends StateNotifier<PostReportState> {
  PostReportController(this._repository) : super(const PostReportState());

  final IReportRepository _repository;

  void onPageChange(int page) => state = state.copyWith(currentPage: page);

  void onSchoolChange(SchoolOption school) =>
      state = state.copyWith(selectedSchool: school);

  void onReportTypeChange(ReportType type) =>
      state = state.copyWith(selectedReportType: type);

  void onDescriptionChange(String value) => state = state.copyWith(
      descriptionInput: DescriptionTextInput.dirty(value: value));

  void onCategoryChange(Category? value) => state =
      state.copyWith(categoryInput: CategoryOptionInput.dirty(value: value));

  void onLocationChange(LatLng? value) {
    if (value == null) return;

    state = state.copyWith(
      locationInput: LocationPickInput.dirty(
        value: Position(
          latitude: value.latitude,
          longitude: value.longitude,
        ),
      ),
    );
  }

  void addAdditionalInfo() {
    if (state.additionalInfoInputs.length >= kMaxAdditionalInfo) return;

    final newList = [
      ...state.additionalInfoInputs,
      AdditionalInfoInputWrapper(
        key: UniqueKey(),
        labelInput: const LabelTextInput.pure(),
        informationInput: const InformationTextInput.pure(),
      ),
    ];

    state = state.copyWith(additionalInfoInputs: newList);
  }

  void removeAdditionalInfo(int index) {
    debugPrint('Removing item at index: $index');
    final newList = state.additionalInfoInputs.toList();
    newList.removeAt(index);

    state = state.copyWith(additionalInfoInputs: newList);
  }

  void onLabelChange(int index, String value) {
    final newList = state.additionalInfoInputs.toList();
    final newItem = state.additionalInfoInputs[index].copyWith(
      labelInput: LabelTextInput.dirty(value: value),
    );

    newList[index] = newItem;

    state = state.copyWith(additionalInfoInputs: newList);
  }

  void onInformationChange(int index, String value) {
    final newList = state.additionalInfoInputs.toList();
    final newItem = state.additionalInfoInputs[index].copyWith(
      informationInput: InformationTextInput.dirty(value: value),
    );

    newList[index] = newItem;

    state = state.copyWith(additionalInfoInputs: newList);
  }

  void onImagesSelected(List<XFile> images) {
    state = state.copyWith(
      imageInput: ImagePickInput.dirty(value: state.imageInput.value + images),
    );
  }

  void onImageDeleted(XFile image) {
    final newList = state.imageInput.value;
    newList.remove(image);

    state = state.copyWith(imageInput: ImagePickInput.dirty(value: newList));
  }

  void _validateForm() {
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
                informationInput:
                    InformationTextInput.dirty(value: e.informationInput.value),
              ),
            )
            .toList(),
        imageInput: ImagePickInput.dirty(value: state.imageInput.value),
        validated: Formz.validate([
          state.descriptionInput,
          state.categoryInput,
          state.locationInput,
          ...state.additionalInfoInputs.map((e) => e.labelInput).toList(),
          ...state.additionalInfoInputs.map((e) => e.informationInput).toList(),
          state.imageInput,
        ]));
  }

  void getSchools() async {
    state = state.copyWith(schoolLoading: true);
    await Future.delayed(kDurationLong);
    final dummySchools = List.generate(
      10,
      (index) => SchoolOption(
        id: index.toString(),
        name: 'SD Negeri ${index + 1} Sidomulyo',
      ),
    );
    state = state.copyWith(schoolLoading: false, schools: dummySchools);
  }

  void initReportInfoForm() async {
    if (state.selectedSchool == null || state.selectedReportType == null) {
      return;
    }

    state = state.copyWith(infoFormLoading: true);

    await _getSchoolFloorPlan(state.selectedSchool!.id);
    await _getCategories(state.selectedReportType!.name);

    state = state.copyWith(infoFormLoading: false);
  }

  Future<void> _getSchoolFloorPlan(String schoolId) async {
    return Future.delayed(kDurationLong);
  }

  Future<void> _getCategories(String reportType) async {
    return Future.delayed(
      kDurationLong,
      () {
        state = state.copyWith(
          categories: List.generate(
            5,
            (index) => Category(id: '$index', label: 'Category-$index'),
          ),
        );
      },
    );
  }

  void setSuccessMessage(String? message) =>
      state = state.copyWith(successMessage: message);

  void setErrorMessage(String? message) =>
      state = state.copyWith(errorMessage: message);

  void onSubmit() async {
    _validateForm();
    if (!state.validated) return;

    state = state.copyWith(finalFormSubmitting: true);

    final report = ReportRequest(
      schoolId: state.selectedSchool!.id,
      reportType: state.selectedReportType!.name,
      description: state.descriptionInput.value,
      categoryId: state.categoryInput.value!.id,
      position: state.locationInput.value!,
    );
    final images = state.imageInput.value.map((e) => File(e.path)).toList();
    final result = await _repository.postReport(report, images);

    result.fold(
      (l) {
        setErrorMessage(l.message);
        state = state.copyWith(finalFormSubmitting: false);
      },
      (r) {
        setSuccessMessage('Laporan berhasil diunggah');
        state = state.copyWith(finalFormSubmitting: false);
      },
    );
  }
}

final postReportControllerProvider =
    StateNotifierProvider.autoDispose<PostReportController, PostReportState>(
  (ref) {
    final repo = ref.watch(reportRepositoryProvider);
    return PostReportController(repo);
  },
);
