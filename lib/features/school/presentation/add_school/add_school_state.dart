import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../models/floor_plan_ui_model.dart';
import '../models/school_name_text_input.dart';
import '../models/school_address_text_input.dart';

part 'add_school_state.freezed.dart';

@freezed
class AddSchoolState with _$AddSchoolState {
  const factory AddSchoolState({
    @Default(0) int currentPage,
    @Default(SchoolNameInput.pure()) SchoolNameInput schoolNameInput,
    @Default(SchoolAddressInput.pure()) SchoolAddressInput schoolAddressInput,
    FloorPlanUiModel? floorPlan,
    @Default(false) bool finalFormSubmitting,
    @Default(false) bool validated,
    String? successMessage,
    String? errorMessage,
    XFile? coverImage,
  }) = _AddSchoolState;
}
