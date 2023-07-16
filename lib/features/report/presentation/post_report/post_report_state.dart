import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tetenger_bumi/common/models/regency.dart';
import 'package:tetenger_bumi/common/models/village.dart';
import 'package:tetenger_bumi/features/report/presentation/models/date_input.dart';
import 'package:tetenger_bumi/features/report/presentation/models/district_input.dart';
import 'package:tetenger_bumi/features/report/presentation/models/plant_name_input.dart';
import 'package:tetenger_bumi/features/report/presentation/models/village_input.dart';
import 'package:tetenger_bumi/features/report/presentation/post_report/post_report_screen.dart';

import '../../../../common/models/district.dart';
import '../../../../common/models/province.dart';
import '../../domain/report_detail.dart';
import '../../domain/category.dart';
import '../models/category_option_input.dart';
import '../models/description_text_input.dart';
import '../models/image_pick_input.dart';
import '../models/location_pick_input.dart';
import '../models/planting_count_input.dart';
import '../models/province_input.dart';
import '../models/regency_input.dart';

part 'post_report_state.freezed.dart';

@freezed
class PostReportState with _$PostReportState {
  const factory PostReportState({
    PlantDetail? reportDetail,
    @Default(FormType.post) FormType formType,
    @Default(0) int currentPage,
    @Default(true) bool firstFormLoading,
    @Default(true) bool infoFormLoading,
    @Default(false) bool finalFormSubmitting,
    @Default([]) List<Category> categories,
    @Default([]) List<Province> provinces,
    @Default([]) List<Regency> regencies,
    @Default([]) List<District> districts,
    @Default([]) List<Village> villages,
    @Default(DescriptionTextInput.pure()) DescriptionTextInput descriptionInput,
    @Default(PlantNameInput.pure()) PlantNameInput nameInput,
    @Default(CategoryOptionInput.pure()) CategoryOptionInput categoryInput,
    @Default(LocationPickInput.pure()) LocationPickInput locationInput,
    @Default(VillageInput.pure()) VillageInput villageInput,
    @Default(DistrictInput.pure()) DistrictInput districtInput,
    @Default(RegencyInput.pure()) RegencyInput regencyInput,
    @Default(ProvinceInput.pure()) ProvinceInput provinceInput,
    @Default(ImagePickInput.pure()) ImagePickInput imageInput,
    @Default(DateInput.pure()) DateInput plantingDateInput,
    @Default(PlantingCountInput.pure()) PlantingCountInput plantingCountInput,
    @Default([]) List<String> deletedImages,
    @Default(false) bool validated,
    String? successMessage,
    String? errorMessage,
  }) = _PostReportState;
}
