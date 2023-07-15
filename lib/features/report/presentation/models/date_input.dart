import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';
import '../../../../common/models/position.dart';

enum DateInputError {
  empty;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descDateCannotBeEmpty;
    }
  }
}

class DateInput extends FormzInput<DateTime?, DateInputError> {
  const DateInput.pure(): super.pure(null);

  const DateInput.dirty({DateTime? value}): super.dirty(value);

  @override
  DateInputError? validator(DateTime? value) {
    if (value == null) return DateInputError.empty;

    return null;
  }
}