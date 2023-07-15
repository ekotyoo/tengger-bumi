import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';
import '../../../../common/models/regency.dart';

enum RegencyInputError {
  empty;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descRegencyCannotBeEmpty;
    }
  }
}

class RegencyInput extends FormzInput<Regency?, RegencyInputError> {
  const RegencyInput.pure() : super.pure(null);

  const RegencyInput.dirty({Regency? value}): super.dirty(value);

  @override
  RegencyInputError? validator(Regency? value) {
    if (value == null) return RegencyInputError.empty;

    return null;
  }
}