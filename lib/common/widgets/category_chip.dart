import 'package:flutter/material.dart';

import '../constants/constant.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.label,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: backgroundColor ?? kColorPrimary50,
      labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: foregroundColor ?? kColorPrimary500,
          fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SWSizes.s8),
      ),
    );
  }
}

class SelectChip extends StatelessWidget {
  const SelectChip({super.key, required this.label, this.selected = false});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return CategoryChip(
      label: label,
      foregroundColor: selected ? kColorNeutral0 : kColorPrimary500,
      backgroundColor: selected ? kColorPrimary500 : kColorPrimary50,
    );
  }
}
