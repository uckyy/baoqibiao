import 'package:flutter/material.dart';
import '../../models/detail_segment.dart';

class DetailBlockMemo extends StatelessWidget {
  final DetailSegment segment;

  const DetailBlockMemo({required this.segment});

  @override
  Widget build(BuildContext context) {
    if (segment.memoText.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        segment.memoText,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
