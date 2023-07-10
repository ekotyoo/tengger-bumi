import 'package:flutter/material.dart';

import '../common/constants/constant.dart';

Color getColorFromAnalysisScore(double? value) {
  if (value == null) return kColorNeutral200;
  final score = (value * 100).toInt();

  if (score >= 61 && score <= 100) {
    return kColorSuccess300;
  } else if (score >= 34 && score <= 66) {
    return const Color(0xFFFFB84C);
  }

  return kColorError300;
}

String getLabelFromAnalysisScore(double? value) {
  if (value == null) return '-';
  final score = (value * 100).toInt();

  if (score >= 61 && score <= 100) {
    return 'Baik';
  } else if (score >= 34 && score <= 66) {
    return 'Cukup';
  }

  return 'Rendah';
}