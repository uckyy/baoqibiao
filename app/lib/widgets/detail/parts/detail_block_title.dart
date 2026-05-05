import 'package:flutter/material.dart';
import '../../models/detail_segment.dart';

class DetailBlockTitle extends StatelessWidget {
  final DetailSegment segment;

  const DetailBlockTitle({required this.segment});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(segment.segmentTitle, style: theme.textTheme.titleSmall),
        ),
        if (segment.hintText.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              segment.hintText,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onTertiaryContainer,
              ),
            ),
          ),
      ],
    );
  }
}
