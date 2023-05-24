import 'dart:io';

import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_watch_semeru/common/services/http_client.dart';
import '../models/school_address_text_input.dart';
import '../models/school_name_text_input.dart';
import '../../data/school_repository.dart';

import 'edit_school_state.dart';

part 'edit_school_controller.g.dart';

@riverpod
class EditSchoolController extends _$EditSchoolController {
  @override
  Future<EditSchoolState> build(int schoolId) async {
    final repo = ref.read(schoolRepositoryProvider);
    final result = await repo.getSchool(schoolId: schoolId);

    final school = result.fold(
      (l) {
        setErrorMessage(l.message);
        return null;
      },
      (r) => r,
    );

    if (school == null) throw Exception('Tidak dapat mendapatkan data sekolah');

    return EditSchoolState(
      school: school,
      cover: school.image,
      newCover: null,
      schoolNameInput: SchoolNameInput.dirty(value: school.name),
      schoolAddressInput: SchoolAddressInput.dirty(value: school.address),
    );
  }

  void onImageSelected(XFile image) {
    final oldState = state.requireValue;
    state = AsyncValue.data(oldState.copyWith(
      newCover: image,
    ));
    _validateForm();
  }

  void onDeleteImage() {
    final oldState = state.requireValue;
    if (oldState.cover != null) {
      state = AsyncValue.data(
        oldState.copyWith(
          deletedImage: oldState.cover!.replaceAll(
            kBaseUrl,
            'public',
          ),
        ),
      );
    }

    state = AsyncValue.data(oldState.copyWith(newCover: null, cover: null));
    _validateForm();
  }

  void onSchoolNameChange(String value) {
    final oldState = state.requireValue;
    final schoolNameInput = SchoolNameInput.dirty(value: value);
    state = AsyncValue.data(
      oldState.copyWith(
        schoolNameInput: schoolNameInput,
      ),
    );
    _validateForm();
  }

  void onSchoolAddressChange(String value) {
    final oldState = state.requireValue;
    final schoolAddressInput = SchoolAddressInput.dirty(value: value);
    state = AsyncValue.data(
      oldState.copyWith(
        schoolAddressInput: schoolAddressInput,
      ),
    );
    _validateForm();
  }

  bool _validateCover(String? cover, XFile? newCover) {
    final oldState = state.requireValue;
    final school = oldState.school;

    return school.image != cover || newCover != null;
  }

  void _validateForm() {
    final oldState = state.requireValue;
    state = AsyncValue.data(
      oldState.copyWith(
        schoolNameInput:
            SchoolNameInput.dirty(value: oldState.schoolNameInput.value),
        schoolAddressInput:
            SchoolAddressInput.dirty(value: oldState.schoolAddressInput.value),
      ),
    );

    final currentState = state.requireValue;
    state = AsyncValue.data(
      currentState.copyWith(
        validated: ((currentState.schoolNameInput.value !=
                    currentState.school.name) ||
                (currentState.schoolAddressInput.value !=
                    currentState.school.address) ||
                _validateCover(currentState.cover, currentState.newCover)) &&
            Formz.validate([
              currentState.schoolNameInput,
              currentState.schoolAddressInput,
            ]),
      ),
    );
  }

  void setErrorMessage(String? message) {
    final oldState = state.requireValue;
    state = AsyncValue.data(oldState.copyWith(errorMessage: message));
  }

  void setSuccessMessage(String? message) {
    final oldState = state.requireValue;
    state = AsyncValue.data(oldState.copyWith(successMessage: message));
  }

  void onSubmit() async {
    _validateForm();

    if (!state.requireValue.validated) return;
    final oldState = state.requireValue;
    state = AsyncValue.data(oldState.copyWith(submitting: true));
    final repo = ref.read(schoolRepositoryProvider);

    final result = await repo.updateSchool(
      schoolId: schoolId,
      name: oldState.schoolNameInput.value,
      address: oldState.schoolAddressInput.value,
      cover: oldState.newCover != null ? File(oldState.newCover!.path) : null,
    );

    result.fold(
      (l) => setErrorMessage(l.message),
      (r) => setSuccessMessage('Laporan berhasil disunting'),
    );

    state = AsyncValue.data(oldState.copyWith(submitting: false));
  }
}
