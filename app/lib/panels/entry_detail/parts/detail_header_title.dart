import 'package:flutter/material.dart';
import '../../models/entry_detail.dart';

class DetailHeaderTitle extends StatelessWidget {
  final EntryDetail detail;

  const DetailHeaderTitle({required this.detail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(detail.entryTitle, style: theme.textTheme.titleLarge),
        const SizedBox(height: 4),
        Text(
          "${detail.artistAlias} · 星${detail.rankValue} · BPM ${detail.tempoValue}",
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
