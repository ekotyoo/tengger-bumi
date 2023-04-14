import 'package:formz/formz.dart';

import '../../../common/constants/constant.dart';
import '../../../utils/string_validator.dart';

enum NameTextInputError {
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

class NameTextInput extends FormzInput<String, NameTextInputError> {
  const NameTextInput.pure() : super.pure('');

  const NameTextInput.dirty({String value = ''}) : super.dirty(value);

  @override
  NameTextInputError? validator(String value) {
    if (!NotEmptyInputValidator().isValid(value)) {
      return NameTextInputError.empty;
    }
    if (!MinLengthInputValidator(3).isValid(value)) {
      return NameTextInputError.invalid;
    }

    return null;
  }
}
