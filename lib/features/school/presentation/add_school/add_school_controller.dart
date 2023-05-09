import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:school_watch_semeru/features/school/presentation/models/floor_plan_ui_model.dart';

import '../models/room_ui_model.dart';
import '../models/school_address_text_input.dart';
import '../models/school_name_text_input.dart';
import 'add_school_state.dart';

class AddSchoolController extends StateNotifier<AddSchoolState> {
  AddSchoolController() : super(const AddSchoolState());

  void onPageChange(int page) => state = state.copyWith(currentPage: page);

  void onSchoolNameChange(String value) => state =
      state.copyWith(schoolNameInput: SchoolNameInput.dirty(value: value));

  void onSchoolAddressChange(String value) => state = state.copyWith(
      schoolAddressInput: SchoolAddressInput.dirty(value: value));

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

  void onSubmit() {
    state = state.copyWith(
      schoolNameInput:
          SchoolNameInput.dirty(value: state.schoolNameInput.value),
      schoolAddressInput:
          SchoolAddressInput.dirty(value: state.schoolAddressInput.value),
    );

    Formz.validate([state.schoolNameInput, state.schoolAddressInput]);
  }
}

final addSchoolControllerProvider =
    StateNotifierProvider.autoDispose<AddSchoolController, AddSchoolState>(
  (ref) => AddSchoolController(),
);
