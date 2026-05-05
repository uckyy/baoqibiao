import 'package:flutter/material.dart';
import '../../models/detail_segment.dart';

class DetailBlockTime extends StatelessWidget {
  final DetailSegment segment;

  const DetailBlockTime({required this.segment});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(Icons.play_arrow, size: 16, color: theme.colorScheme.primary),
        const SizedBox(width: 4),
        Text(segment.startText, style: theme.textTheme.bodySmall),
        const SizedBox(width: 16),
        Icon(Icons.stop, size: 16, color: theme.colorScheme.primary),
        const SizedBox(width: 4),
        Text(segment.endText, style: theme.textTheme.bodySmall),
      ],
    );
  }
}
