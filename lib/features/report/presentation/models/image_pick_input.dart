import 'package:formz/formz.dart';
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

class ImagePickInput extends FormzInput<List<XFile>, ImagePickInputError> {
  const ImagePickInput.pure(): super.pure(const []);

  const ImagePickInput.dirty({List<XFile> value = const []}): super.dirty(value);

  @override
  ImagePickInputError? validator(List<XFile> value) {
    if (value.isEmpty) return ImagePickInputError.empty;

    return null;
  }
}