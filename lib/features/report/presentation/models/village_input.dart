import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';
import '../../../../common/models/village.dart';

enum VillageInputError {
  empty;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descVillageCannotBeEmpty;
    }
  }
}

class VillageInput extends FormzInput<Village?, VillageInputError> {
  const VillageInput.pure() : super.pure(null);

  const VillageInput.dirty({Village? value}): super.dirty(value);

  @override
  VillageInputError? validator(Village? value) {
    if (value == null) return VillageInputError.empty;

    return null;
  }
}