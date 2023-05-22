import 'package:formz/formz.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/constants/constant.dart';

enum ImagePickInputError {
  empty;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descImageCannotBeEmpty;
    }
  }
}

class ImagePickInput extends FormzInput<List<Either<XFile, String>>, ImagePickInputError> {
  const ImagePickInput.pure(): super.pure(const []);

  const ImagePickInput.dirty({List<Either<XFile, String>> value = const []}): super.dirty(value);

  @override
  ImagePickInputError? validator(List<Either<XFile, String>> value) {
    if (value.isEmpty) return ImagePickInputError.empty;

    return null;
  }
}