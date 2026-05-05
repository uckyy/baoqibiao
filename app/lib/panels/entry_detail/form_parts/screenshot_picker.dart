import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';

class ScreenshotPicker extends StatelessWidget {
  final String? path;
  final bool disabled;
  final VoidCallback onPicked;

  const ScreenshotPicker({
    this.path,
    this.disabled = false,
    required this.onPicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        OutlinedButton.icon(
          onPressed: disabled ? null : onPicked,
          icon: const Icon(Icons.attach_file, size: 16),
          label: Text(path != null ? "已选择截图" : "选择截图"),
        ),
        if (path != null) ...[
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              path!.split(Platform.pathSeparator).last,
              style: theme.textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }
}
