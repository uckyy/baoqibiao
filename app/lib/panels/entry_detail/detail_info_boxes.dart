import 'package:flutter/material.dart';
import '../../models/entry_detail.dart';

class DetailInfoBoxes extends StatelessWidget {
  final EntryDetail detail;

  const DetailInfoBoxes({required this.detail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (detail.commonText.isNotEmpty)
          _infoBox(
            theme,
            detail.commonText,
            theme.colorScheme.surfaceContainerHighest,
            null,
          ),
        if (detail.summaryText.isNotEmpty) ...[
          const SizedBox(height: 8),
          _infoBox(
            theme,
            detail.summaryText,
            theme.colorScheme.tertiaryContainer,
            theme.colorScheme.onTertiaryContainer,
          ),
        ],
      ],
    );
  }

  Widget _infoBox(ThemeData theme, String text, Color bg, Color? fg) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: theme.textTheme.bodySmall?.copyWith(color: fg),
      ),
    );
  }
}
