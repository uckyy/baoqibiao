import 'package:flutter/material.dart';
import '../../models/entry.dart';

class EntryTileTitle extends StatelessWidget {
  final Entry entry;

  const EntryTileTitle({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Text(
      entry.entryTitle,
      style: Theme.of(context).textTheme.titleSmall,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
