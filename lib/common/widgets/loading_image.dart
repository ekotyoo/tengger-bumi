import 'package:flutter/material.dart';

class LoadingImage extends StatelessWidget {
  const LoadingImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.fit,
  });

  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image(
      key: ValueKey(url),
      image: NetworkImage(url),
      height: height,
      width: width,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) {
        return const Center(child: Text('Failed to load image'));
      },
    );
  }
}
