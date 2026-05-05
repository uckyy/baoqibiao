import 'package:flutter/material.dart';
import '../../models/entry.dart';
import 'entry_avatar.dart';
import 'entry_chips.dart';
import 'parts/entry_tile_title.dart';
import 'parts/entry_tile_subtitle.dart';
import 'parts/entry_tile_arrow.dart';

class EntryTile extends StatelessWidget {
  final Entry entry;
  final VoidCallback onTap;

  const EntryTile({required this.entry, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EntryAvatar(),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EntryTileTitle(entry: entry),
                  const SizedBox(height: 2),
                  EntryTileSubtitle(entry: entry),
                  const SizedBox(height: 4),
                  EntryChips(texts: entry.chipTexts),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const EntryTileArrow(),
          ],
        ),
      ),
    );
  }
}
