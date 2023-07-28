import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:tetenger_bumi/common/models/province.dart';
import 'package:tetenger_bumi/common/services/http_client.dart';
import 'package:tetenger_bumi/features/report/data/area_repository.dart';
import 'package:tetenger_bumi/features/report/data/i_area_repository.dart';
import 'package:tetenger_bumi/features/report/domain/plant_request.dart';
import 'package:tetenger_bumi/features/report/presentation/models/date_input.dart';
import 'package:tetenger_bumi/features/report/presentation/models/district_input.dart';
import 'package:tetenger_bumi/features/report/presentation/models/plant_name_input.dart';
import 'package:tetenger_bumi/features/report/presentation/models/planting_count_input.dart';
import 'package:tetenger_bumi/features/report/presentation/models/province_input.dart';
import 'package:tetenger_bumi/features/report/presentation/models/regency_input.dart';
import 'package:tetenger_bumi/features/report/presentation/models/village_input.dart';
import '../../../../common/models/district.dart';
import '../../../../common/models/regency.dart';
import '../../../../common/models/village.dart';
import '../../domain/report_detail.dart';
import 'post_report_screen.dart';
import 'package:collection/collection.dart';
import '../../data/i_report_repository.dart';
import '../../data/report_repository.dart';
import '../../../../common/models/position.dart';
import '../models/image_pick_input.dart';
import '../models/category_option_input.dart';
import '../models/location_pick_input.dart';
import '../../domain/category.dart';
import '../models/description_text_input.dart';
import '../report_feed/report_feed_controller.dart';
import 'post_report_state.dart';

const kMaxAdditionalInfo = 3;

class PostReportController extends StateNotifier<PostReportState> {
  PostReportController(
    this._reportRepository,
    this._areaRepository,
    this._ref,
    FormType formType,
  ) : super(PostReportState(formType: formType));

  final IReportRepository _reportRepository;
  final IAreaRepository _areaRepository;
  final Ref _ref;

  void onPageChange(int page) => state = state.copyWith(currentPage: page);

  void onNameChange(String value) =>
      state = state.copyWith(nameInput: PlantNameInput.dirty(value: value));

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

  void onPlantingDateChange(DateTime? value) {
    if (value == null) return;

    state = state.copyWith(plantingDateInput: DateInput.dirty(value: value));
  }

  void onPlantingCountChange(int value) {
    state = state.copyWith(
        plantingCountInput: PlantingCountInput.dirty(value: value));
  }

  void onProvinceChange(Province value) async {
    state = state.copyWith(
        provinceInput: ProvinceInput.dirty(value: value),
        regencies: [],
        districts: [],
        villages: [],
        regencyInput: const RegencyInput.pure(),
        districtInput: const DistrictInput.pure(),
        villageInput: const VillageInput.pure());
    await _getRegencies(value.id);
  }

  Future<void> _getProvinces() async {
    final result = await _areaRepository.getProvinces();
    result.fold(
      (l) => setErrorMessage(l.message),
      (r) => state = state.copyWith(
        provinces: r,
      ),
    );
  }

  void onRegencyChange(Regency value) async {
    state = state.copyWith(
        regencyInput: RegencyInput.dirty(value: value),
        districts: [],
        villages: [],
        districtInput: const DistrictInput.pure(),
        villageInput: const VillageInput.pure());
    await _getDistricts(value.id);
  }

  Future<void> _getRegencies(int provinceId) async {
    final result = await _areaRepository.getRegencies(provinceId: provinceId);
    result.fold(
      (l) => setErrorMessage(l.message),
      (r) => state = state.copyWith(
        regencies: r,
      ),
    );
  }

  void onDistrictChange(District value) async {
    state = state.copyWith(
        districtInput: DistrictInput.dirty(value: value),
        villages: [],
        villageInput: const VillageInput.pure());
    await _getVillages(value.id);
  }

  Future<void> _getDistricts(int regencyId) async {
    final result = await _areaRepository.getDistricts(regencyId: regencyId);
    result.fold(
      (l) => setErrorMessage(l.message),
      (r) => state = state.copyWith(
        districts: r,
      ),
    );
  }

  void onVillageChange(Village value) =>
      state = state.copyWith(villageInput: VillageInput.dirty(value: value));

  Future<void> _getVillages(int districtId) async {
    final result = await _areaRepository.getVillages(districtId: districtId);
    result.fold(
      (l) => setErrorMessage(l.message),
      (r) => state = state.copyWith(
        villages: r,
      ),
    );
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
      nameInput: PlantNameInput.dirty(
        value: state.nameInput.value,
      ),
      plantingCountInput: PlantingCountInput.dirty(
        value: state.plantingCountInput.value,
      ),
      plantingDateInput: DateInput.dirty(
        value: state.plantingDateInput.value,
      ),
      descriptionInput: DescriptionTextInput.dirty(
        value: state.descriptionInput.value,
      ),
      categoryInput: CategoryOptionInput.dirty(
        value: state.categoryInput.value,
      ),
      locationInput: LocationPickInput.dirty(
        value: state.locationInput.value,
      ),
      villageInput: VillageInput.dirty(
        value: state.villageInput.value,
      ),
      districtInput: DistrictInput.dirty(
        value: state.districtInput.value,
      ),
      regencyInput: RegencyInput.dirty(value: state.regencyInput.value),
      provinceInput: ProvinceInput.dirty(value: state.provinceInput.value),
      imageInput: ImagePickInput.dirty(value: state.imageInput.value),
    );

    final validated = Formz.validate([
      state.nameInput,
      state.plantingCountInput,
      state.plantingDateInput,
      state.descriptionInput,
      state.categoryInput,
      state.locationInput,
      state.villageInput,
      state.districtInput,
      state.regencyInput,
      state.provinceInput,
      state.imageInput,
    ]);

    state = state.copyWith(validated: validated);
  }

  void initForm(int? reportId) async {
    state = state.copyWith(firstFormLoading: true);

    await _getProvinces();

    if (reportId != null) {
      await getReportDetail(reportId);
      final reportDetail = state.reportDetail;
      await _populateReportDetail(reportDetail);
    }
    await initReportInfoForm();
    state = state.copyWith(firstFormLoading: false);
  }

  Future<void> getReportDetail(int reportId) async {
    final result = await _reportRepository.getPlant(plantId: reportId);
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

  Future<void> _populateReportDetail(PlantDetail? report) async {
    if (report == null) return;
    final selectedLocation = report.position;
    final images = report.images.map((e) => right<XFile, String>(e)).toList();
    if (report.province != null &&
        report.regency != null &&
        report.district != null &&
        report.village != null) {
      await _getRegencies(report.province!.id);
      await _getDistricts(report.regency!.id);
      await _getVillages(report.district!.id);
      state = state.copyWith(
          provinceInput: ProvinceInput.dirty(value: report.province),
          regencyInput: RegencyInput.dirty(value: report.regency),
          districtInput: DistrictInput.dirty(value: report.district),
          villageInput: VillageInput.dirty(value: report.village));
    }

    state = state.copyWith(
      locationInput: LocationPickInput.dirty(value: selectedLocation),
      descriptionInput: DescriptionTextInput.dirty(value: report.description),
      imageInput: ImagePickInput.dirty(value: images),
      nameInput: PlantNameInput.dirty(value: report.name),
      plantingCountInput: PlantingCountInput.dirty(value: report.plantingCount),
      plantingDateInput: DateInput.dirty(value: report.plantingDate),
    );
  }

  Future<void> initReportInfoForm() async {
    state = state.copyWith(infoFormLoading: true);

    await _getCategories();

    if (state.formType == FormType.edit) {
      final report = state.reportDetail;
      if (report == null) return;

      Category? selectedCategory;

      selectedCategory = state.categories.firstWhereOrNull(
        (element) {
          return element.id == report.category.id;
        },
      );

      state = state.copyWith(
        categoryInput: selectedCategory != null
            ? CategoryOptionInput.dirty(value: selectedCategory)
            : const CategoryOptionInput.pure(),
      );
    }

    state = state.copyWith(infoFormLoading: false);
  }

  Future<void> _getCategories() async {
    final result = await _reportRepository.getCategories();
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
    final plant = PlantRequest(
      name: state.nameInput.value,
      description: state.descriptionInput.value,
      categoryId: state.categoryInput.value!.id,
      latitude: position.latitude,
      longitude: position.longitude,
      villageId: state.villageInput.value!.id,
      deletedImages: state.deletedImages
          .map((e) => e.replaceAll(kBaseUrl, 'public'))
          .toList(),
      plantingDate: state.plantingDateInput.value!.millisecondsSinceEpoch,
      plantingCount: state.plantingCountInput.value,
    );

    final images = state.imageInput.value
        .map((e) => e.fold((l) => l, (r) => null))
        .where((e) => e != null)
        .map((e) => File(e!.path))
        .toList();

    if (state.formType == FormType.edit) {
      if (state.reportDetail == null) return;
      final result = await _reportRepository.updatePlant(
          plantId: state.reportDetail!.id, plant: plant, images: images);

      result.fold(
        (l) {
          setErrorMessage(l.message);
          state = state.copyWith(finalFormSubmitting: false);
        },
        (r) {
          final reportFilter = _ref.read(reportFilterStateProvider);
          _ref
              .read(reportFeedControllerProvider(reportFilter).notifier)
              .updateReport(r);
          setSuccessMessage('Postingan berhasil disunting');
          state = state.copyWith(finalFormSubmitting: false);
        },
      );

      return;
    }

    final result = await _reportRepository.postPlant(plant, images);

    result.fold(
      (l) {
        setErrorMessage(l.message);
        state = state.copyWith(finalFormSubmitting: false);
      },
      (r) {
        final reportFilter = _ref.read(reportFilterStateProvider);
        _ref
            .read(reportFeedControllerProvider(reportFilter).notifier)
            .addReport(r);
        setSuccessMessage('Postingan berhasil diunggah');
        state = state.copyWith(finalFormSubmitting: false);
      },
    );
  }
}

final postReportControllerProvider = StateNotifierProvider.autoDispose
    .family<PostReportController, PostReportState, FormType>(
  (ref, type) {
    final reportRepository = ref.watch(reportRepositoryProvider);
    final areaRepository = ref.watch(areaRepositoryProvider);
    return PostReportController(reportRepository, areaRepository, ref, type);
  },
);
