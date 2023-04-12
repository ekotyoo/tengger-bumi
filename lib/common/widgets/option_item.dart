import 'package:flutter/material.dart';

import '../constants/constant.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({
    super.key,
    required this.label,
    this.caption,
    this.selected = false,
    required this.onTap,
    this.backgroundColor,
  });

  final String label;
  final String? caption;
  final bool selected;
  final VoidCallback onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final text = caption != null
        ? Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(caption!, style: Theme.of(context).textTheme.bodySmall)
              ],
            ),
          )
        : Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          );

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(SWSizes.s16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SWSizes.s8),
          color: backgroundColor ?? kColorPrimary50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            text,
            Icon(
              selected
                  ? Icons.check_circle_outline_rounded
                  : Icons.circle_outlined,
            )
          ],
        ),
      ),
    );
  }
}
