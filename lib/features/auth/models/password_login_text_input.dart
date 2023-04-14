import 'package:formz/formz.dart';
import '../../../common/constants/constant.dart';
import '../../../utils/string_validator.dart';

enum PasswordLoginTextError {
  empty,
  tooShort;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descPasswordCannotBeEmpty;
      case tooShort:
        return SWStrings.descPasswordTooShort;
    }
  }
}

class PasswordLoginTextInput extends FormzInput<String, PasswordLoginTextError> {
  const PasswordLoginTextInput.pure() : super.pure('');

  const PasswordLoginTextInput.dirty({String value = ''}) : super.dirty(value);

  @override
  PasswordLoginTextError? validator(String value) {
    if (!NotEmptyInputValidator().isValid(value)) {
      return PasswordLoginTextError.empty;
    }
    if (!MinLengthInputValidator(8).isValid(value)) {
      return PasswordLoginTextError.tooShort;
    }

    return null;
  }
}
