import 'package:equatable/equatable.dart';
import 'package:school_watch_semeru/features/school/presentation/models/school_name_text_input.dart';

import '../models/school_address_text_input.dart';

class AddSchoolState extends Equatable {
  const AddSchoolState({
    this.currentPage = 0,
    this.schoolNameInput = const SchoolNameInput.pure(),
    this.schoolAddressInput = const SchoolAddressInput.pure(),
  });

  final int currentPage;
  final SchoolNameInput schoolNameInput;
  final SchoolAddressInput schoolAddressInput;

  AddSchoolState copyWith({
    int? currentPage,
    SchoolNameInput? schoolNameInput,
    SchoolAddressInput? schoolAddressInput,
  }) {
    return AddSchoolState(
      currentPage: currentPage ?? this.currentPage,
      schoolNameInput: schoolNameInput ?? this.schoolNameInput,
      schoolAddressInput: schoolAddressInput ?? this.schoolAddressInput,
    );
  }

  @override
  List<Object?> get props => [currentPage, schoolNameInput, schoolAddressInput];
}
