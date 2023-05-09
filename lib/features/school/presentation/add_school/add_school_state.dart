import 'package:equatable/equatable.dart';

import '../models/floor_plan_ui_model.dart';
import '../models/school_name_text_input.dart';
import '../models/school_address_text_input.dart';

class AddSchoolState extends Equatable {
  const AddSchoolState({
    this.currentPage = 0,
    this.schoolNameInput = const SchoolNameInput.pure(),
    this.schoolAddressInput = const SchoolAddressInput.pure(),
    this.floorPlan,
  });

  final int currentPage;
  final SchoolNameInput schoolNameInput;
  final SchoolAddressInput schoolAddressInput;
  final FloorPlanUiModel? floorPlan;

  AddSchoolState copyWith({
    int? currentPage,
    SchoolNameInput? schoolNameInput,
    SchoolAddressInput? schoolAddressInput,
    FloorPlanUiModel? floorPlan,
  }) {
    return AddSchoolState(
      currentPage: currentPage ?? this.currentPage,
      schoolNameInput: schoolNameInput ?? this.schoolNameInput,
      schoolAddressInput: schoolAddressInput ?? this.schoolAddressInput,
      floorPlan: floorPlan ?? this.floorPlan,
    );
  }

  @override
  List<Object?> get props => [currentPage, schoolNameInput, schoolAddressInput];
}
