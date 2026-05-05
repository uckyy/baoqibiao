import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final bool disabled;
  final VoidCallback onPressed;

  const SubmitButton({
    this.disabled = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: disabled ? null : onPressed,
      child: const Text("提交反馈"),
    );
  }
}
