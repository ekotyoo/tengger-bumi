import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:school_watch_semeru/common/services/http_client.dart';
import '../../domain/report_detail.dart';
import 'post_report_screen.dart';
import 'package:collection/collection.dart';

import '../../domain/additional_info.dart';
import '../../../school/presentation/models/room_ui_model.dart';
import '../../../school/data/i_school_repository.dart';
import '../../../school/data/school_repository.dart';
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
import '../report_feed/report_feed_controller.dart';
import 'post_report_state.dart';
import 'widgets/pick_report_type_form.dart';
import 'widgets/pick_school_form.dart';

const kMaxAdditionalInfo = 3;

class PostReportController extends StateNotifier<PostReportState> {
  PostReportController(this._reportRepository, this._schoolRepository,
      this._ref, FormType formType)
      : super(PostReportState(formType: formType));

  final IReportRepository _reportRepository;
  final ISchoolRepository _schoolRepository;
  final Ref _ref;

  void onPageChange(int page) => state = state.copyWith(currentPage: page);

  void onActiveInactiveChange(bool value) => state = state.copyWith(isActive: value);

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

  void onSelectedRoomChange(RoomUiModel? value) {
    if (value == null) return;
    state = state.copyWith(selectedRoom: value);
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
    final imageInput = ImagePickInput.dirty(
      value: [
        ...state.imageInput.value,
        ...images.map((e) => left<XFile, String>(e)).toList()
      ],
    );

    Formz.validate([imageInput]);

    state = state.copyWith(imageInput: imageInput);
  }

  void onImageDeleted(Either<XFile, String> image) {
    final newList = state.imageInput.value;
    newList.remove(image);

    image.fold(
      (l) => null,
      (r) {
        final newDeletedImages = [...state.deletedImages, r];
        state = state.copyWith(deletedImages: newDeletedImages);
      },
    );

    final imageInput = ImagePickInput.dirty(value: newList);

    Formz.validate([imageInput]);

    state = state.copyWith(imageInput: imageInput);
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
    );

    final validated = Formz.validate([
          state.descriptionInput,
          state.categoryInput,
          state.locationInput,
          ...state.additionalInfoInputs.map((e) => e.labelInput).toList(),
          ...state.additionalInfoInputs.map((e) => e.informationInput).toList(),
          state.imageInput,
        ]) &&
        state.selectedRoom != null;

    debugPrint('Validated: $validated');

    state = state.copyWith(validated: validated);
  }

  void initForm(int? reportId) async {
    state = state.copyWith(firstFormLoading: true);
    await getSchools();
    if (reportId != null) {
      await getReportDetail(reportId);
      await _populateReportDetail(state.reportDetail);
    }
    state = state.copyWith(firstFormLoading: false);
  }

  Future<void> getSchools() async {
    final schools = await _schoolRepository.getSchools();
    final schoolOptions = schools.fold(
      (l) {
        setErrorMessage(l.message);
        return const <SchoolOption>[];
      },
      (r) => r.map((e) => SchoolOption(id: e.id, name: e.name)).toList(),
    );
    state = state.copyWith(schools: schoolOptions);
  }

  Future<void> getReportDetail(int reportId) async {
    final result = await _reportRepository.getReport(reportId: reportId);
    final report = await result.fold(
      (l) {
        setErrorMessage(l.message);
        return null;
      },
      (r) async {
        return r;
      },
    );
    state = state.copyWith(reportDetail: report);
  }

  Future<void> _populateReportDetail(ReportDetail? report) async {
    if (report == null) return;

    final selectedSchool =
        state.schools.firstWhere((element) => element.name == report.school);
    final selectedReportType = reportTypes.firstWhere(
        (element) => element.name.toLowerCase() == report.category.type);
    final selectedLocation = report.position;
    final additionalInfos = report.additionalInfos;
    final images = report.images.map((e) => right<XFile, String>(e)).toList();

    state = state.copyWith(
      selectedSchool: selectedSchool,
      selectedReportType: selectedReportType,
      locationInput: LocationPickInput.dirty(value: selectedLocation),
      descriptionInput: DescriptionTextInput.dirty(value: report.description),
      isActive: report.isActive,
      imageInput: ImagePickInput.dirty(value: images),
      additionalInfoInputs: additionalInfos
              ?.map(
                (e) => AdditionalInfoInputWrapper(
                  labelInput: LabelTextInput.dirty(value: e.label),
                  informationInput:
                      InformationTextInput.dirty(value: e.information),
                  key: UniqueKey(),
                ),
              )
              .toList() ??
          [],
    );
  }

  void initReportInfoForm() async {
    if (state.selectedSchool == null || state.selectedReportType == null) {
      return;
    }

    state = state.copyWith(infoFormLoading: true);

    await _getSchoolDetail(state.selectedSchool!.id);
    await _getCategories(state.selectedReportType!.name.toLowerCase());

    if (state.formType == FormType.edit) {
      final report = state.reportDetail;
      if (report == null) return;

      Category? selectedCategory;

      if (report.category.type ==
          (state.selectedReportType?.name.toLowerCase() ?? false)) {
        selectedCategory = state.categories.firstWhereOrNull(
          (element) {
            return element.id == report.category.id;
          },
        );
      }

      final room = state.selectedSchoolData?.floorPlan.rooms
          .firstWhereOrNull((element) => element.id == report.roomId);

      if (room == null) {
        state = state.copyWith(locationInput: const LocationPickInput.pure());
      }

      state = state.copyWith(
        categoryInput: selectedCategory != null
            ? CategoryOptionInput.dirty(value: selectedCategory)
            : const CategoryOptionInput.pure(),
        selectedRoom: room != null ? RoomUiModel.fromDomain(room) : null,
      );
    }

    state = state.copyWith(infoFormLoading: false);
  }

  Future<void> _getSchoolDetail(int schoolId) async {
    final result = await _schoolRepository.getSchool(schoolId: schoolId);
    result.fold(
      (l) => setErrorMessage(l.message),
      (r) => state = state.copyWith(selectedSchoolData: r),
    );
  }

  Future<void> _getCategories(String reportType) async {
    final result = await _reportRepository.getCategories(type: reportType);
    result.fold(
      (l) => setErrorMessage(l.message),
      (r) => state = state.copyWith(
        categories: r,
      ),
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

    final position = state.locationInput.value!;
    final report = ReportRequest(
        schoolId: state.selectedSchool!.id,
        description: state.descriptionInput.value,
        categoryId: state.categoryInput.value!.id,
        latitude: position.latitude,
        longitude: position.longitude,
        roomId: state.selectedRoom!.id!,
        isActive: state.isActive,
        additionalInfos: state.additionalInfoInputs
            .map((e) => AdditionalInfo(
                  label: e.labelInput.value,
                  information: e.informationInput.value,
                ))
            .toList(),
        deletedImages: state.deletedImages
            .map((e) => e.replaceAll(kBaseUrl, 'public'))
            .toList());

    final images = state.imageInput.value
        .map((e) => e.fold((l) => l, (r) => null))
        .where((e) => e != null)
        .map((e) => File(e!.path))
        .toList();

    if (state.formType == FormType.edit) {
      if (state.reportDetail == null) return;
      final result = await _reportRepository.updateReport(
          reportId: state.reportDetail!.id, report: report, images: images);

      result.fold(
        (l) {
          setErrorMessage(l.message);
          state = state.copyWith(finalFormSubmitting: false);
        },
        (r) {
          final reportFilter = _ref.read(reportFilterStateProvider);
          if (r.category.type == reportFilter.reportType?.name.toLowerCase() ||
              reportFilter.reportType == null) {
            _ref
                .read(reportFeedControllerProvider(reportFilter).notifier)
                .updateReport(r);
          }
          setSuccessMessage('Laporan berhasil disunting');
          state = state.copyWith(finalFormSubmitting: false);
        },
      );

      return;
    }

    final result = await _reportRepository.postReport(report, images);

    result.fold(
      (l) {
        setErrorMessage(l.message);
        state = state.copyWith(finalFormSubmitting: false);
      },
      (r) {
        final reportFilter = _ref.read(reportFilterStateProvider);
        if (r.category.type == reportFilter.reportType?.name.toLowerCase() ||
            reportFilter.reportType == null) {
          _ref
              .read(reportFeedControllerProvider(reportFilter).notifier)
              .addReport(r);
        }
        setSuccessMessage('Laporan berhasil diunggah');
        state = state.copyWith(finalFormSubmitting: false);
      },
    );
  }
}

final postReportControllerProvider = StateNotifierProvider.autoDispose
    .family<PostReportController, PostReportState, FormType>(
  (ref, type) {
    final reportRepository = ref.watch(reportRepositoryProvider);
    final schoolRepository = ref.watch(schoolRepositoryProvider);
    return PostReportController(reportRepository, schoolRepository, ref, type);
  },
);
