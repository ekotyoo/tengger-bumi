import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';
import '../../../../utils/string_validator.dart';

enum DescriptionTextInputError {
  empty,
  tooShort;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descDescriptionCannotBeEmpty;
      case tooShort:
        return SWStrings.descDescriptionTooShort;
    }
  }
}

class DescriptionTextInput extends FormzInput<String, DescriptionTextInputError> {
  const DescriptionTextInput.pure() : super.pure('');

  const DescriptionTextInput.dirty({String value = ''}) : super.dirty(value);

  @override
  DescriptionTextInputError? validator(String value) {
    if (!NotEmptyInputValidator().isValid(value)) {
      return DescriptionTextInputError.empty;
    }
    if (!MinLengthInputValidator(3).isValid(value)) {
      return DescriptionTextInputError.tooShort;
    }

    return null;
  }
}
