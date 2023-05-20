import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/auth_user.dart';
import '../models/name_text_input.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    @Default(NameTextInput.pure()) nameTextInput,
    @Default(false) bool isSubmitting,
    @Default(false) bool validated,
    String? avatar,
    XFile? newAvatar,
    required SignedIn user,
    String? successMessage,
    String? errorMessage,
  }) = _EditProfileState;
}
