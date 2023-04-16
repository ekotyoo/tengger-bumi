import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';

enum InformationTextInputError {
  empty;

  String getErrorMessage() {
    switch(this) {
      case empty:
        return SWStrings.descInformationCannotBeEmpty;
    }
  }
}

class InformationTextInput extends FormzInput<String, InformationTextInputError> {
  const InformationTextInput.pure(): super.pure('');

  const InformationTextInput.dirty({String value = ''}): super.dirty(value);

  @override
  InformationTextInputError? validator(String value) {
    if (value.isEmpty) return InformationTextInputError.empty;
    return null;
  }
}
