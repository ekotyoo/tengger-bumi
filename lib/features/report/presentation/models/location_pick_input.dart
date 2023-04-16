import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';
import '../../domain/latlng.dart';

enum LocationPickInputError {
  empty;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descLocationCannotBeEmpty;
    }
  }
}

class LocationPickInput extends FormzInput<LatLng?, LocationPickInputError> {
  const LocationPickInput.pure(): super.pure(null);

  const LocationPickInput.dirty({LatLng? value}): super.dirty(value);

  @override
  LocationPickInputError? validator(LatLng? value) {
    if (value == null) return LocationPickInputError.empty;

    return null;
  }
}