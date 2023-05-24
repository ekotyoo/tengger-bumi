import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/constant.dart';

class ShimmerContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double borderRadius;

  const ShimmerContainer({
    super.key,
    this.height,
    this.width = double.infinity,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kColorNeutral40,
      highlightColor: kColorNeutral10,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: const Center(),
      ),
    );
  }
}
