import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';
import '../../../../common/models/position.dart';

enum LocationPickInputError {
  empty;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descLocationCannotBeEmpty;
    }
  }
}

class LocationPickInput extends FormzInput<Position?, LocationPickInputError> {
  const LocationPickInput.pure(): super.pure(null);

  const LocationPickInput.dirty({Position? value}): super.dirty(value);

  @override
  LocationPickInputError? validator(Position? value) {
    if (value == null) return LocationPickInputError.empty;

    return null;
  }
}