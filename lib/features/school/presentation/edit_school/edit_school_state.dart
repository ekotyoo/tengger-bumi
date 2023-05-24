import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/school_detail.dart';
import '../models/school_address_text_input.dart';
import '../models/school_name_text_input.dart';

part 'edit_school_state.freezed.dart';

@freezed
class EditSchoolState with _$EditSchoolState {
  const factory EditSchoolState({
    SchoolDetail? school,
    @Default(SchoolNameInput.pure()) SchoolNameInput schoolNameInput,
    @Default(SchoolAddressInput.pure()) SchoolAddressInput schoolAddressInput,
    @Default(false) bool validated,
    String? successMessage,
    String? errorMessage,
    String? cover,
    XFile? newCover,
    @Default(false) bool submitting,
  }) = _EditSchoolState;
}