import 'package:flutter/material.dart';

import '../constants/constant.dart';

enum SWTextFieldType { normal, email, password, number }

class SWTextField extends StatefulWidget {
  const SWTextField({
    super.key,
    this.type = SWTextFieldType.normal,
    this.hint,
    this.action,
    this.controller,
    this.maxLines = 1,
    this.errorText,
    this.onChanged,
    this.enabled = true,
    this.initialText,
  });

  final TextEditingController? controller;
  final String? initialText;
  final SWTextFieldType type;
  final String? hint;
  final TextInputAction? action;
  final int maxLines;
  final String? errorText;
  final Function(String)? onChanged;
  final bool enabled;

  @override
  State<SWTextField> createState() => _SWTextFieldState();
}

class _SWTextFieldState extends State<SWTextField> {
  var obscureText = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    if (widget.initialText != null) {
      _controller.text = widget.initialText!;
    }
    obscureText = widget.type == SWTextFieldType.password;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextInputType? keyboardType;
    Widget? inputIcon;

    if (widget.type == SWTextFieldType.email) {
      keyboardType = TextInputType.emailAddress;
    } else if (widget.type == SWTextFieldType.password) {
      keyboardType = TextInputType.visiblePassword;
      inputIcon = GestureDetector(
        onTap: () => setState(() => obscureText = !obscureText),
        child: Icon(
          obscureText ? Icons.visibility_off_rounded : Icons.visibility_rounded,
        ),
      );
    } else if  (widget.type == SWTextFieldType.number) {
      keyboardType = TextInputType.number;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          keyboardType: keyboardType,
          enabled: widget.enabled,
          textInputAction: widget.action,
          maxLines: widget.maxLines,
          style: Theme.of(context).textTheme.bodyMedium,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: inputIcon,
          ),
          onChanged: widget.onChanged,
        ),
        if (widget.errorText != null) ...[
          const SizedBox(height: SWSizes.s4),
          Text(
            widget.errorText!,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Theme.of(context).colorScheme.error),
          ),
          const SizedBox(height: SWSizes.s4),
        ]
      ],
    );
  }
}
