import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';

enum LabelTextInputError {
  empty;

  String getErrorMessage() {
    switch(this) {
      case empty:
        return SWStrings.descLabelCannotBeEmpty;
    }
  }
}

class LabelTextInput extends FormzInput<String, LabelTextInputError> {
  const LabelTextInput.pure(): super.pure('');

  const LabelTextInput.dirty({String value = ''}): super.dirty(value);

  @override
  LabelTextInputError? validator(String value) {
    if (value.isEmpty) return LabelTextInputError.empty;
    return null;
  }
}
