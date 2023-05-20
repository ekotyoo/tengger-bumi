import 'dart:io';

import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth_controller.dart';
import '../../data/auth_repository.dart';
import '../models/name_text_input.dart';
import '../../domain/auth_user.dart';
import 'edit_profile_state.dart';

part 'edit_profile_controller.g.dart';

@riverpod
class EditProfileController extends _$EditProfileController {
  @override
  EditProfileState build(SignedIn user) => EditProfileState(
        user: user,
        avatar: user.avatar,
        nameTextInput: NameTextInput.dirty(value: user.name),
      );

  void onNameChange(String value) {
    final nameInput = NameTextInput.dirty(value: value);

    state = state.copyWith(
      nameTextInput: nameInput,
      validated: Formz.validate([nameInput]) &&
          (nameInput.value != user.name ||
              validateAvatar(state.avatar, state.newAvatar)),
    );
  }

  bool validateAvatar(String? avatar, XFile? newAvatar) =>
      user.avatar != avatar || newAvatar != null;

  void onNewAvatarChange(XFile? value) {
    final valid = Formz.validate([state.nameTextInput]) &&
        (state.nameTextInput.value != user.name ||
            validateAvatar(state.avatar, value));
    state = state.copyWith(
      newAvatar: value,
      validated: valid,
    );
  }

  void onAvatarChange(String? avatar) => state = state.copyWith(
        avatar: avatar,
        validated: Formz.validate([state.nameTextInput]) &&
            (state.nameTextInput.value != user.name ||
                validateAvatar(avatar, state.newAvatar)),
      );

  void setErrorMessage(String? message) => state = state.copyWith(errorMessage: message);

  void setSuccessMessage(String? message) => state = state.copyWith(successMessage: message);

  void onSubmit() async {
    if (!state.validated || state.isSubmitting) return;
    final repo = ref.read(authRepositoryProvider);

    state = state.copyWith(isSubmitting: true);

    final deleteOld = state.avatar == null && state.newAvatar == null;

    final result = await repo.updateProfile(
      userId: state.user.id,
      name: (state.nameTextInput as NameTextInput).value,
      deleteOld: deleteOld,
      newAvatar: state.newAvatar != null ? File(state.newAvatar!.path) : null,
    );

    result.fold(
      (l) => setErrorMessage(l.message),
      (r) {
        ref.read(authStateProvider.notifier).state = r;
        ref.read(authControllerProvider.notifier).setAuthUser(r);
        setSuccessMessage('Profil berhasil diperbaharui');
      },
    );
    state = state.copyWith(isSubmitting: false);
  }
}
