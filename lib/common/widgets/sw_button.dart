import 'package:flutter/material.dart';

import '../constants/constant.dart';

class SWButton extends StatelessWidget {
  const SWButton({
    Key? key,
    this.onPressed,
    required this.label,
    this.disabled = false,
    this.loading = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String label;
  final bool disabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled
          ? null
          : () {
              if (loading) return;
              onPressed?.call();
            },
      child: loading ? _buildLoadingIndicator(context) : Text(label),
    );
  }

  _buildLoadingIndicator(BuildContext context) {
    return SizedBox(
      height: SWSizes.s32,
      width: SWSizes.s32,
      child: CircularProgressIndicator(
        strokeWidth: SWSizes.s4,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
