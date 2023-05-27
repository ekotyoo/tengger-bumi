import 'package:flutter/material.dart';

import '../common/constants/constant.dart';

Color getColorFromAnalysisScore(double? value) {
  if (value == null) return kColorNeutral200;
  final score = (value * 100).toInt();

  if (score >= 61 && score <= 100) {
    return Colors.green.shade700;
  } else if (score >= 34 && score <= 66) {
    return Colors.yellow;
  }

  return Colors.red.shade700;
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