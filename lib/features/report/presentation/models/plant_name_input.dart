import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';
import '../../../../utils/string_validator.dart';

enum PlantNameInputError {
  empty,
  invalid;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descNameCannotBeEmpty;
      case invalid:
        return SWStrings.descNameInvalid;
    }
  }
}

class PlantNameInput extends FormzInput<String, PlantNameInputError> {
  const PlantNameInput.pure() : super.pure('');

  const PlantNameInput.dirty({String value = ''}) : super.dirty(value);

  @override
  PlantNameInputError? validator(String value) {
    if (!NotEmptyInputValidator().isValid(value)) {
      return PlantNameInputError.empty;
    }
    if (!MinLengthInputValidator(3).isValid(value)) {
      return PlantNameInputError.invalid;
    }

    return null;
  }
}
