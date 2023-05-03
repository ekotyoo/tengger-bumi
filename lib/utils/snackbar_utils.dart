import 'package:flutter/material.dart';
import '../common/constants/constant.dart';

enum SnackbarType { error, success }

showSnackbar(
  BuildContext context, {
  SnackbarType type = SnackbarType.success,
  required String message,
}) {
  final snackbar = SnackBar(
    content: Text(message),
    backgroundColor:
        type == SnackbarType.success ? kColorSuccess300 : kColorError300,
    duration: kDurationLong,
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..clearSnackBars()
    ..showSnackBar(snackbar);
}
