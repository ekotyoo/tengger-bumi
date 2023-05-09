import 'package:flutter/material.dart';

import '../constants/constant.dart';

class TitleWithCaption extends StatelessWidget {
  const TitleWithCaption({
    super.key,
    required this.title,
    this.caption,
  });

  final String title;
  final String? caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        if (caption != null)
          Text(
            caption!,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: kColorNeutral200),
          ),
      ],
    );
  }
}
