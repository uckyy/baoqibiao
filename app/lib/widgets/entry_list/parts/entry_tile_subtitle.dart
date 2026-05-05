import 'package:flutter/material.dart';
import '../../models/entry.dart';

class EntryTileSubtitle extends StatelessWidget {
  final Entry entry;

  const EntryTileSubtitle({required this.entry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      "${entry.artistAlias} · BPM ${entry.tempoValue}",
      style: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
