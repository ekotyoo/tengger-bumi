import 'dart:io';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:polylabel/polylabel.dart';
import 'package:tetenger_bumi/common/models/position.dart';
import 'package:tetenger_bumi/features/school/domain/school_request.dart';

import '../../data/school_repository.dart';
import '../../data/i_school_repository.dart';
import '../models/floor_plan_ui_model.dart';
import '../models/room_ui_model.dart';
import '../models/school_address_text_input.dart';
import '../models/school_name_text_input.dart';
import 'add_school_state.dart';

class AddSchoolController extends StateNotifier<AddSchoolState> {
  AddSchoolController(this._repository) : super(const AddSchoolState());

  final ISchoolRepository _repository;

  void onPageChange(int page) => state = state.copyWith(currentPage: page);

  void onSchoolNameChange(String value) => state =
      state.copyWith(schoolNameInput: SchoolNameInput.dirty(value: value));

  void onSchoolAddressChange(String value) => state = state.copyWith(
      schoolAddressInput: SchoolAddressInput.dirty(value: value));

  void onCoverImageChanged(XFile? image) => state =  state.copyWith(coverImage: image);

  void addRoom(RoomUiModel room) {
    final newRooms = state.floorPlan?.rooms ?? [];
    newRooms.add(room);

    final floorPlan = state.floorPlan?.copyWith(rooms: newRooms) ??
        FloorPlanUiModel(rooms: newRooms);

    state = state.copyWith(floorPlan: floorPlan);
  }

  void deleteRoom(RoomUiModel room) {
    final newRooms = state.floorPlan?.rooms ?? [];
    newRooms.remove(room);

    final floorPlan = state.floorPlan?.copyWith(rooms: newRooms);
    state = state.copyWith(floorPlan: floorPlan);
  }

  void setSuccessMessage(String? message) => state = state.copyWith(successMessage: message);

  void setErrorMessage(String? message) => state = state.copyWith(errorMessage: message);

  void onSubmit() async {
    _validateForm();
    if (!state.validated) return;

    state = state.copyWith(finalFormSubmitting: true);

    final schoolCentroid = _getSchoolCentroid(state.floorPlan!);
    final school = SchoolRequest(
      name: state.schoolNameInput.value,
      address: state.schoolAddressInput.value,
      floorPlan: state.floorPlan!.toDomain(),
      centroid: schoolCentroid,
    );

    final image = state.coverImage != null ? File(state.coverImage!.path) : null;

    final result = await _repository.postSchool(school: school, coverImage: image);

    state = state.copyWith(finalFormSubmitting: false);
    result.fold(
      (l) => setErrorMessage(l.message),
      (r) => setSuccessMessage('Berhasil menambahkan sekolah'),
    );
  }

  Position _getSchoolCentroid(FloorPlanUiModel floorPlan) {
    final points = floorPlan.rooms
        .map((e) => e.polygon.points
        .map((p) => Point(p.latitude, p.longitude))
        .toList())
        .toList();

    final result = polylabel(points).point;
    return Position(latitude: result.x.toDouble(), longitude: result.y.toDouble());
  }

  void _validateForm() {
    state = state.copyWith(
      schoolNameInput:
          SchoolNameInput.dirty(value: state.schoolNameInput.value),
      schoolAddressInput:
          SchoolAddressInput.dirty(value: state.schoolAddressInput.value),
      validated:
          Formz.validate([state.schoolNameInput, state.schoolAddressInput]) &&
              state.floorPlan != null,
    );
  }
}

final addSchoolControllerProvider =
    StateNotifierProvider.autoDispose<AddSchoolController, AddSchoolState>(
  (ref) {
    final repo = ref.watch(schoolRepositoryProvider);
    return AddSchoolController(repo);
  },
);
